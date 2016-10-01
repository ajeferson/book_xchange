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

end


end