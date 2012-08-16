module PetsHelper
  def pet_status(status)
    unless Pet::STATUS.key?(status)
      "Not a valid status"
    else
      Pet::STATUS[status]
    end
  end

  def pet_type(type)
    unless Pet::TYPE.key?(type)
      "Not a valid type"
    else
      Pet::TYPE[type]
    end
  end

  def all_statuses
    status = ['Has owner', 1],
             ['Looking for mate',2],
             ['Looking to be adopted', 3]
  end

  def animal_types
   type = ['Dog', 1],
          ['Cat',2],
          ['Bird', 3],
          ['Aquarium Animal',4],
          ['Farm Animal',5],
          ['Exotic Animal',6]

  end

end
