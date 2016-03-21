class GraphQL::BaseType
  def connection_type(edge_type: nil)
    @connection_type ||= define_connection(edge_type: edge_type)
  end

  def edge_type
    @edge_type ||= GraphQL::Relay::Edge.create_type(self)
  end

  def define_connection(edge_type: nil, &block)
    if !@connection_type.nil?
      raise("#{name}'s connection type was already defined, can't redefine it!")
    end
    @connection_type = GraphQL::Relay::BaseConnection.create_type(self, edge_type: edge_type, &block)
  end
end
