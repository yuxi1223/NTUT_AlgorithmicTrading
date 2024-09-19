# 設定樂透參數
lottery_numbers <- 1:49
winning_numbers <- c(17, 32, 5, 49, 1, 24)  # 手動設定頭獎號碼
ticket_cost <- 50
prize_3 <- 400
prize_4 <- 2000
prize_5 <- 100000

# 初始化變數
total_cost <- 0
total_winnings <- 0
count <- 0
jackpot <- FALSE

# 模擬購買樂透直到中頭獎
while (!jackpot) {
  count <- count + 1
  total_cost <- total_cost + ticket_cost
  
  # 抽選本次樂透號碼
  current_draw <- sample(lottery_numbers, 6)
  
  # 計算中獎數字數量
  matches <- sum(current_draw %in% winning_numbers)
  
  # 根據中獎數字計算獎金
  if (matches == 3) {
    total_winnings <- total_winnings + prize_3
  } else if (matches == 4) {
    total_winnings <- total_winnings + prize_4
  } else if (matches == 5) {
    total_winnings <- total_winnings + prize_5
  } else if (matches == 6) {
    jackpot <- TRUE
  }
}

# 計算淨花費
net_cost <- total_cost - total_winnings

# 輸出結果
cat("頭獎號碼:", paste(winning_numbers, collapse = ", "), "\n")
cat("在中頭獎前共買了", count, "次樂透\n")
cat("總花費:", total_cost, "元\n")
cat("總獎金:", total_winnings, "元\n")
cat("淨花費:", net_cost, "元\n")