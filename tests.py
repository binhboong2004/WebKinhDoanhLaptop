import unittest
import hashlib
import sqlite3

# Hàm tạo ID ngẫu nhiên
def unique_id():
    import uuid
    return str(uuid.uuid4())

# Hàm mã hóa mật khẩu
def hash_password(password):
    return hashlib.sha1(password.encode()).hexdigest()

# Giả lập kết nối cơ sở dữ liệu
def get_db_connection():
    conn = sqlite3.connect(':memory:')
    conn.execute('''CREATE TABLE users
                    (id TEXT PRIMARY KEY NOT NULL,
                    name TEXT NOT NULL,
                    email TEXT NOT NULL,
                    password TEXT NOT NULL,
                    image TEXT NOT NULL);''')
    return conn

class TestModels(unittest.TestCase):
    
    def setUp(self):
        self.conn = get_db_connection()
        self.cursor = self.conn.cursor()
        self.email = 'test@example.com'
        self.cursor.execute("INSERT INTO users (id, name, email, password, image) VALUES (?, ?, ?, ?, ?)",
                            (unique_id(), 'Test User', self.email, hash_password('password123'), 'test_image.jpg'))

    def test_email_exists(self):
        self.cursor.execute("SELECT * FROM users WHERE email = ?", (self.email,))
        self.assertTrue(len(self.cursor.fetchall()) > 0)

    def test_password_match(self):
        pass1 = hash_password('password123')
        pass2 = hash_password('password123')
        self.assertEqual(pass1, pass2)

    def test_insert_user(self):
        user_id = unique_id()
        name = 'New User'
        email = 'newuser@example.com'
        password = hash_password('password123')
        image = 'new_image.jpg'
        self.cursor.execute("INSERT INTO users (id, name, email, password, image) VALUES (?, ?, ?, ?, ?)",
                            (user_id, name, email, password, image))
        self.conn.commit()
        self.cursor.execute("SELECT * FROM users WHERE email = ?", (email,))
        self.assertTrue(len(self.cursor.fetchall()) > 0)

    def test_set_cookie(self):
        email = 'newuser@example.com'
        password = hash_password('password123')
        self.cursor.execute("INSERT INTO users (id, name, email, password, image) VALUES (?, ?, ?, ?, ?)",
                            (unique_id(), 'New User', email, password, 'new_image.jpg'))
        self.cursor.execute("SELECT * FROM users WHERE email = ? AND password = ? LIMIT 1", (email, password))
        row = self.cursor.fetchone()
        if row:
            cookie_value = row[0]  # Giả lập việc thiết lập cookie
        self.assertEqual(cookie_value, row[0])

class RegisterForm:
    def __init__(self, name, email, password, confirm_password, image):
        self.name = name
        self.email = email
        self.password = password
        self.confirm_password = confirm_password
        self.image = image

    def is_valid(self):
        if len(self.name) == 0 or len(self.email) == 0 or len(self.password) == 0 or len(self.confirm_password) == 0 or len(self.image) == 0:
            return False
        if self.password != self.confirm_password:
            return False
        return True

class TestForms(unittest.TestCase):

    def test_register_form_valid(self):
        form = RegisterForm(name="John Doe", email="john@example.com", password="password123", confirm_password="password123", image="image.jpg")
        self.assertTrue(form.is_valid())

    def test_register_form_invalid_empty_fields(self):
        form = RegisterForm(name="", email="john@example.com", password="password123", confirm_password="password123", image="image.jpg")
        self.assertFalse(form.is_valid())

        form = RegisterForm(name="John Doe", email="", password="password123", confirm_password="password123", image="image.jpg")
        self.assertFalse(form.is_valid())

        form = RegisterForm(name="John Doe", email="john@example.com", password="", confirm_password="password123", image="image.jpg")
        self.assertFalse(form.is_valid())

        form = RegisterForm(name="John Doe", email="john@example.com", password="password123", confirm_password="", image="image.jpg")
        self.assertFalse(form.is_valid())

        form = RegisterForm(name="John Doe", email="john@example.com", password="password123", confirm_password="password123", image="")
        self.assertFalse(form.is_valid())

    def test_register_form_password_mismatch(self):
        form = RegisterForm(name="John Doe", email="john@example.com", password="password123", confirm_password="password321", image="image.jpg")
        self.assertFalse(form.is_valid())

if __name__ == '__main__':
    unittest.main()