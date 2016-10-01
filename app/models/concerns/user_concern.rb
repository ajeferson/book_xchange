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

end

end