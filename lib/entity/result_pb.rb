require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("entity/result.proto", :syntax => :proto3) do
    add_message "grpc.Result" do
      optional :_tid, :string, 1
      optional :name, :string, 2
      optional :age, :string, 3
    end
  end
end

module Grpc
  Result = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("grpc.Result").msgclass
end
