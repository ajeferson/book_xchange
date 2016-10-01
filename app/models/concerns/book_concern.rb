module BookConcern extend ActiveSupport::Concern


class_methods do

  def top_titles
    Book.find_by_sql('SELECT
                        SUM(points) AS points,
                        name
                      FROM
                        evaluations
                      JOIN
                        books
                      ON
                        book_isbn = isbn
                      GROUP BY
                        isbn
                      ORDER BY
                        points DESC
                      LIMIT
                        3')
  end

  def top_exchanged_books
    Book.find_by_sql(
        "SELECT
          COUNT(isbn) AS exchanges, name
        FROM (
          SELECT
            *
          FROM
            exchanges
          WHERE
            date BETWEEN '2016-09-01' and '2016-09-25'
        ) AS t1
        JOIN
          books
        ON
          t1.book_a_isbn = isbn or t1.book_b_isbn = isbn
        GROUP BY
          isbn
        ORDER BY
          exchanges DESC, name ASC
        LIMIT
          3"
    )
  end

  def books_info
    Book.find_by_sql(
        'SELECT
          *
        FROM
          books_info'
    )
  end

end


end