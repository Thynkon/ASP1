require "administrate/base_dashboard"

class StudentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    acronym: Field::String,
    address: Field::String,
    birthdate: Field::Date,
    city: Field::BelongsTo,
    email: Field::String,
    encrypted_password: Field::String,
    evaluations: Field::HasMany,
    exams: Field::HasMany,
    firstname: Field::String,
    lastname: Field::String,
    person_has_role: Field::HasMany,
    promotions: Field::HasMany,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    roles: Field::HasMany,
    semesters: Field::HasMany,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    acronym
    address
    birthdate
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    acronym
    address
    birthdate
    city
    email
    encrypted_password
    evaluations
    exams
    firstname
    lastname
    person_has_role
    promotions
    remember_created_at
    reset_password_sent_at
    reset_password_token
    roles
    semesters
    type
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    acronym
    address
    birthdate
    city
    email
    encrypted_password
    evaluations
    exams
    firstname
    lastname
    person_has_role
    promotions
    remember_created_at
    reset_password_sent_at
    reset_password_token
    roles
    semesters
    type
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how students are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(student)
  #   "Student ##{student.id}"
  # end
end
