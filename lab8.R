# TRANSACTION DATA 
transactions <- list(
  c("Shirt", "Trouser", "Tie"),
  c("Shirt", "Trouser"),
  c("Trouser", "Socks"),
  c("Shirt", "Tie"),
  c("Shirt", "Trouser", "Socks"),
  c("Shirt", "Tie", "Trouser"),
  c("Socks", "Trouser")
)

#  **SUPPORT FUNCTION**
calculate_support <- function(itemset, transactions) {
  count <- sum(sapply(transactions, function(tr) all(itemset %in% tr)))
  return(count / length(transactions))
}

# CONFIDENCE FUNCTION**
calculate_confidence <- function(A, B, transactions) {
  support_AB <- calculate_support(c(A, B), transactions)
  support_A <- calculate_support(A, transactions)
  return(support_AB / support_A)
}

# THRESHOLDS 
support_threshold <- 0.3       # 30%
confidence_threshold <- 0.5    # 50%


all_items <- unique(unlist(transactions))
rules <- list()

#LOOP THROUGH ALL POSSIBLE COMBINATIONS OF ITEMS
for (from_item in all_items) {
  for (to_item in all_items) {
    if (from_item != to_item) {
      
      # Calculate Metrics
      support_from <- calculate_support(from_item, transactions)
      support_to <- calculate_support(to_item, transactions)
      support_both <- calculate_support(c(from_item, to_item), transactions)
      confidence <- calculate_confidence(from_item, to_item, transactions)
      
      # Check thresholds 
      if (support_both > support_threshold && confidence > confidence_threshold) {
        
        # Store rule
        rules <- append(rules, list(list(
          from_item = from_item, 
          to_item = to_item, 
          support_from = round(support_from, 2),
          support_to = round(support_to, 2),
          support_both = round(support_both, 2),
          confidence = round(confidence, 2)
        )))
        
        # ️ Print Rule Details
        cat("=====================================\n")
        cat("Rule: ", from_item, "→", to_item, "\n")
        cat("Support of", from_item, ":", round(support_from, 2), "\n")
        cat("Support of", to_item, ":", round(support_to, 2), "\n")
        cat("Support of (", from_item, ",", to_item, "):", round(support_both, 2), "\n")
        cat("Confidence (", from_item, "→", to_item, "):", round(confidence, 2), "\n")
        cat("=====================================\n\n")
      }
    }
  }
}
