# frozen_string_literal: true

require "active_record_unit"
require "fixtures/project"
require "fixtures/developer"

class FormHelperActiveRecordTest < ActionView::TestCase
  tests ActionView::Helpers::AssetTagHelper

  def image_tag(*)
    @output_buffer = super
  end
  # def form_for(*)
  #   @output_buffer = super
  # end

  def setup
    # @developer = Developer.new
    # @developer.id   = 123
    # @developer.name = "developer #123"
    #
    # @project = Project.new
    # @project.id   = 321
    # @project.name = "project #321"
    # @project.save
    #
    # @developer.projects << @project
    # @developer.save
  end

  def teardown
    # Project.delete(321)
    # Developer.delete(123)
  end

  Routes = ActionDispatch::Routing::RouteSet.new
  Routes.draw do
    resources :developers do
      resources :projects
    end
  end

  include Routes.url_helpers

  def test_nested_fields_for_with_child_index_option_override_on_a_nested_attributes_collection_association
    # form_for(@developer) do |f|
    #   concat f.fields_for(:projects, @developer.projects.first, child_index: "abc") { |cf|
    #     concat cf.text_field(:name)
    #   }
    # end
    #
    # expected = whole_form("/developers/123", "edit_developer_123", "edit_developer", method: "patch") do
    #   '<input id="developer_projects_attributes_abc_name" name="developer[projects_attributes][abc][name]" type="text" value="project #321" />' \
    #     '<input id="developer_projects_attributes_abc_id" name="developer[projects_attributes][abc][id]" type="hidden" value="321" />'
    # end

    assert_dom_equal expected, output_buffer
  end
end
