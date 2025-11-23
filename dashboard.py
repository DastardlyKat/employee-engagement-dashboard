import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="aadi4512Y",
    database="employee"
)

employee = pd.read_sql("SELECT * FROM Employee", conn)
department = pd.read_sql("SELECT * FROM Department", conn)
program = pd.read_sql("SELECT * FROM Program", conn)
participation = pd.read_sql("SELECT * FROM Participation", conn)
rewards = pd.read_sql("SELECT * FROM Rewards", conn)
redemption = pd.read_sql("SELECT * FROM Redemption", conn)

# PARTICIPATION PER PROGRAM
df = pd.read_sql("""
                SELECT pr.program_name, COUNT(p.participation_id) as participation
                FROM Program pr
                LEFT JOIN Participation p ON pr.program_id = p.program_id
                GROUP BY pr.program_id
                """, conn)

plt.bar(df["program_name"], df["participation"])
plt.title("Participation per Program")
plt.xlabel("Program")
plt.ylabel("Participants")
plt.xticks(rotation=45)
plt.show()

# REWARD REDEMPTION DISTRIBUTION
df = pd.read_sql("""
                 SELECT r.reward_name, COUNT(rd.redemption_id) as total_redemptions
                 FROM Rewards r
                 LEFT JOIN Redemption rd ON r.reward_id = rd.reward_id
                 GROUP BY r.reward_id
                 """, conn)

plt.pie(df["total_redemptions"], labels=df["reward_name"])
plt.title("Reward Redemption Distribution")
plt.show()

# MONTHLY REDEMPTION TREND
df = pd.read_sql("""
                 SELECT MONTH(redeem_date) as month_number, COUNT(redemption_id) as total_redemptions
                 FROM Redemption
                 GROUP BY MONTH(redeem_date)
                 ORDER BY month_number
                 """, conn)

plt.plot(df["month_number"], df["total_redemptions"], marker='o')
plt.title("Monthly Redemption Trend")
plt.xlabel("Month")
plt.ylabel("Total Redemptions")
plt.xticks(df["month_number"])
plt.show()