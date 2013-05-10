class Sentinal < ActiveRecord::Base
  validates_presence_of :name

  def run
  end

  def self.sentinal_list
    [
      OpenStruct.new(display_name: "mongoDB Read-Only", class_name: "MongodbReadOnlySentinal", value: 0),
      OpenStruct.new(display_name: "mongoDB Read-Write", class_name: "MongodbReadWriteSentinal", value: 1),
      OpenStruct.new(display_name: "S3 Read-Only", class_name: "S3ReadOnlySentinal", value: 2),
      OpenStruct.new(display_name: "S3 Read-Write", class_name: "S3ReadWriteSentinal", value: 3)
    ]
  end

  def self.sentinal_struct_from_value(value)
    sentinal_list.find { |s| s.value == value.to_i }
  end

  def self.sentinal_struct_from_class_name(class_name)
    sentinal_list.find { |s| s.class_name == class_name.to_s }
  end
end
