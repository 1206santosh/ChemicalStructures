require "application_system_test_case"

class ChemicalStructuresTest < ApplicationSystemTestCase
  setup do
    @chemical_structure = chemical_structures(:one)
  end

  test "visiting the index" do
    visit chemical_structures_url
    assert_selector "h1", text: "Chemical Structures"
  end

  test "creating a Chemical structure" do
    visit chemical_structures_url
    click_on "New Chemical Structure"

    fill_in "Marvin Structure", with: @chemical_structure.marvin_structure
    fill_in "Name", with: @chemical_structure.name
    fill_in "Ref", with: @chemical_structure.ref_id
    fill_in "Structure Bs64", with: @chemical_structure.structure_bs64
    click_on "Create Chemical structure"

    assert_text "Chemical structure was successfully created"
    click_on "Back"
  end

  test "updating a Chemical structure" do
    visit chemical_structures_url
    click_on "Edit", match: :first

    fill_in "Marvin Structure", with: @chemical_structure.marvin_structure
    fill_in "Name", with: @chemical_structure.name
    fill_in "Ref", with: @chemical_structure.ref_id
    fill_in "Structure Bs64", with: @chemical_structure.structure_bs64
    click_on "Update Chemical structure"

    assert_text "Chemical structure was successfully updated"
    click_on "Back"
  end

  test "destroying a Chemical structure" do
    visit chemical_structures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chemical structure was successfully destroyed"
  end
end
