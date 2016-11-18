# before metaprogramming
class User
  def admin?
    role == "admin"
  end

  def student?
    role == "student"
  end

  def teacher?
    role == "teacher"
  end

  def principal?
    role == "principal"
  end
end

# after metaprogramming
class User
  ROLES = %w(admin student teacher principal)

  ROLES.each do |role_name|
    define_method("#{role_name}?".to_s) do
      role == "#{role_name}"
    end
  end
end

# Advantages
# Shorter: Clearly many fewer lines of code
# More dynamic--I can add a new role type just by adding one to the array.
  # Maybe not such a huge win in this particular case but you could certainly imagine cases where this dynamism was more relevant like maybe it was something in the database that a non developer user could add (assuming you want that)
# Reads better (this is debatable)
#
# Disadvantages
# less "greppable": When there's not actually any method called "admin?" it can be a little bit more difficult to tell where it lives
# Less "friendly": It's certainly less simple and requires someone to have some understanding of metaprogramming in order to get what's going on. role == "principal" is pretty straightforward
#
# As with anything it's about tradeoffs. This is the kind of thing that merits a discussion with your team/coworkers to see what their comfortable with in general or on a case by case basis.
