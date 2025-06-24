class Movie:
    m_id = 1
    
    def __init__(self, mname="not given", mdur="not given", sn=0, t_price=0, st="not given"):
        self.movie_id = Movie.m_id
        Movie.m_id += 1
        self.movie_name = mname
        self.duration = mdur
        self.screen_number = sn
        self.ticket_price = t_price
        self.showtime = st

    def __str__(self):
        return f"Movie id = {self.movie_id},\nMovie Title = {self.movie_name},\nDuration = {self.duration},\nScreen Number = {self.screen_number},\nTicket Price = {self.ticket_price},\nShowtime = {self.showtime}"
        