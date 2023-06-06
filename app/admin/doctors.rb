# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :category_id, :avatar, user_attributes: %i[id phone full_name password role]

  form do |f|
    f.inputs do
      f.inputs 'User', for: [:user_attributes, f.object.user || User.new] do |user|
        user.input :phone
        user.input :full_name
        user.input :password
        user.input :role, input_html: { value: :doctor }, as: :hidden
      end
      f.input :category
      f.input :avatar, as: :file
      f.actions
    end
  end
end
