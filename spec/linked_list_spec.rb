require "./lib/linked_list"

RSpec.describe LinkedList do
  it 'exists and has attributes' do
    list = LinkedList.new
    expect(list).to be_a(LinkedList)
    expect(list.head).to be(nil)
  end 

  it 'append sound' do 
    list = LinkedList.new

    list.append("doop")
      expect(list.head).to be_a Node
      expect(list.head.data).to eq "doop"
      expect(list.head.next_node).to be_nil
  end
   
   it 'count' do 
    list = LinkedList.new 
    list.append("doop")

    expect(list.count).to eq(1)
   end

    it 'to_string'do
      list = LinkedList.new
      list.append("doop")

      expect(list.to_string).to eq "doop"
    end
end



# => <LinkedList head=nil #45678904567>
# > list.head
# => nil
# > list.append("doop")
# => "doop"
# > list
# => <LinkedList head=<Node data="doop" next_node=nil #5678904567890> #45678904567>
# > list.head.next_node
# => nil
# > list.count
# => 1
# > list.to_string
# => "doop"