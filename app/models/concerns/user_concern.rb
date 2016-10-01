module UserConcern extend ActiveSupport::Concern

class_methods do

  def top_contributors(amount = 3)
    User.find_by_sql(
        "SELECT
            COUNT(username) AS exchanges,
            name
          FROM
            exchanges
          JOIN
            users
          ON
            user_a_username = username OR user_b_username = username
          GROUP BY
            username
          ORDER BY
            exchanges DESC, users.name ASC
          LIMIT
            #{amount}"
    )
  end

  def pagenometer
    User.find_by_sql(
        'SELECT
          SUM(t1.sum) AS pages, t1.name
        FROM (
          (
            SELECT
              SUM(pages), username, users.name AS name
            FROM
              exchanges
            JOIN
              users
            ON
              user_b_username = username
            JOIN
              books
            ON
              book_b_isbn = isbn group by username)
            UNION (
              SELECT
                SUM(pages), username, users.name AS name
              FROM
                exchanges
              JOIN
                users
              ON
                user_a_username = username
              JOIN
                books
              ON
                book_a_isbn = isbn group by username
            )
          ) AS t1
          GROUP BY
            t1.username, t1.name
          ORDER BY
            pages DESC'
    )
  end

end

end