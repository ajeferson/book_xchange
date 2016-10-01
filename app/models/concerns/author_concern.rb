module AuthorConcern extend ActiveSupport::Concern

class_methods do

  def top_authors
    Author.find_by_sql(
        'SELECT
          name, t1.ex
        FROM (
          SELECT
            COUNT(books.author_cpf) AS ex,books. author_cpf
          FROM
            exchanges
          JOIN
            books
          ON
            book_a_isbn = isbn or book_b_isbn = isbn
          GROUP BY
            books.author_cpf
        ) AS t1
        JOIN
          authors
        ON
          cpf = t1.author_cpf
        ORDER BY
          ex DESC, authors.name ASC
        LIMIT
          3'
    )
  end

end

end