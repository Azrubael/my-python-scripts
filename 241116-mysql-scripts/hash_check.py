import bcrypt

# Хеш, который имеется
stored_hash = b"$2a$11$0a7VdTr4rfCQqtsvpng6GuJnzUmQ7gZiHXgzGPgm5hkRa3avXgBLK"

# Предполагаемый пароль
password_to_check = b"your_password"

if bcrypt.checkpw(password_to_check, stored_hash):
    print("Пароль верный!")
else:
    print("Пароль неверный.")