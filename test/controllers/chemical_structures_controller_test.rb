require 'test_helper'

class ChemicalStructuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chemical_structure = chemical_structures(:one)
  end

  test "should get index" do
    get chemical_structures_url
    assert_response :success
  end

  test "should get new" do
    get new_chemical_structure_url
    assert_response :success
  end

  test "should create chemical_structure" do
    assert_difference('ChemicalStructure.count') do
      post chemical_structures_url, params: { chemical_structure: { marvin_structure: @chemical_structure.marvin_structure, name: @chemical_structure.name, ref_id: @chemical_structure.ref_id, structure_bs64: @chemical_structure.structure_bs64 } }
    end

    assert_redirected_to chemical_structure_url(ChemicalStructure.last)
  end

  test "should show chemical_structure" do
    get chemical_structure_url(@chemical_structure)
    assert_response :success
  end

  test "should get edit" do
    get edit_chemical_structure_url(@chemical_structure)
    assert_response :success
  end

  test "should update chemical_structure" do
    patch chemical_structure_url(@chemical_structure), params: { chemical_structure: { marvin_structure: @chemical_structure.marvin_structure, name: @chemical_structure.name, ref_id: @chemical_structure.ref_id, structure_bs64: @chemical_structure.structure_bs64 } }
    assert_redirected_to chemical_structure_url(@chemical_structure)
  end

  test "should destroy chemical_structure" do
    assert_difference('ChemicalStructure.count', -1) do
      delete chemical_structure_url(@chemical_structure)
    end

    assert_redirected_to chemical_structures_url
  end
end
