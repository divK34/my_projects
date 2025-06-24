class User:
    u_id = 1

    def __init__(self, name, password):
        self.user_id = User.u_id
        User.u_id += 1
        self.name = name
        self.password = password
        self.bookings = []  # list of movie, qty, total

    def __str__(self):
        return f"User ID = {self.user_id},\n Name = {self.name}"
