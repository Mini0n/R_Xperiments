# Validate.r
#
# Validate if a given password is valid
# Give the user 3 attempts.
# ------------------------------------------------------------------------------

# R contantas are defined using '<-'
# Operational constantes
allowed_attempts <- 3
valid_password <- "TeSt"
# Message constants
instructions_msg <- "Hello.\nYou have 3 attemps.\n\n"
ask_pass_msg <- "Please type password:"
ok_pass_msg <- "Accepted Password! :"
bad_pass_msg <- "Incorrect Password :"
bad_exec <- "Too many errors. Goodbye."
good_exec <- "Success!"

# functions are defined as: "my_function <- function() { ... }"
# checl_password
# received the password to be compared vs "valid_password"
# prints message with success or failure information
# returns TRUE or FALSE
check_password <- function(current_password) {
  message <- bad_pass_msg
  result <- FALSE


  if (current_password == valid_password) {
    message <- ok_pass_msg
    result <- TRUE
  }

  print(paste(message, current_password))
  return(result)
}

print_program_result <- function(success) {
  icon <- "\n\n[ X ]"
  message <- bad_exec
  if (success) {
    icon <- "\n\n[ O ]"
    message <- good_exec
  }

  cat(icon, message)
}

ask_password <- function() {
  print(ask_pass_msg)
  current_password <- readline()

  return(current_password)
}

run_program <- function() {
  cat(instructions_msg) # cat(<string>) allows to use line-breaks

  i <- 0
  success <- FALSE

  while (i < allowed_attempts) {
    current_password <- ask_password()
    success <- check_password(current_password)
    if (success) {
      break
    }
    i <- i + 1
  }

  print_program_result(success)
}

run_program()
