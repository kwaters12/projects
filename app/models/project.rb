class Project < ActiveRecord::Base
  validates_presence_of :title, message: "You have to add a title" 
  validates :title, length: { minimum: 10, too_short: " must have at least 10 characters" }
  validates_presence_of :body, message: "There's nothing in the body of your project"

  # Write a method that returns a list of Question records 
  # that has a title size greater than 30 characters

  # solution 1
  def self.long_titled
    long_projects = []
    Project.all.each do |x|
      if x.title.length > 30
      long_projects << x
      end
    end
    long_projects
  end

  # solution 2 - Much better
  def self.long_titled_2
    Project.select.all {|p| p.title.length > 30}
  end

  # Generate 100 random projects with varying title length

  def self.generate_random_projects(number_of_projects = 100)
    number_of_projects.times do
      random_title = (0...rand(60)).map {('a'..'z').to_a[rand(26)]}.join
      Project.create(title: random_title, body: "Go Flames Go!!")
    end
  end

  # Loop through all the questions in the system and build a 
  # hash whose keys are the IDs of the questions and the values is 
  # the length of the titles
  def set_id_length_hash
    new_hash = {}
    Project.all.each do |project|
      new_hash[project.id] = project.title.length
    end
    new_hash
  end

end
