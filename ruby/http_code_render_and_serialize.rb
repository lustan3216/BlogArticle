module Render

  HTTP_SUCCESS_CODE = [[200, 'OK'], [204, 'No Content']]

  HTTP_SUCCESS_CODE.each do |array|
    define_method(:"render_#{array[0]}") do |data, hash_options = {}, data_options = {}|
      render json: { status: 'Success',
                     message: array[1],
                     data: serialize_data(data, data_options)
                   }.merge(hash_options), status: array[0]
    end
  end


  HTTP_ERROR_CODE = [[400, 'Bad Request'], [401, 'Unauthorized'], [403, 'Forbidden'], [404, 'Not Found'],
                     [500, 'Internal Server Error']]

  HTTP_ERROR_CODE.each do |array|
    define_method(:"render_#{array[0]}") do |hash_options = {}|
      render json: { status: 'Error',
                     message: array[1]
                   }.merge(hash_options), status: array[0]
    end
  end

  private

  def serialize_data(data, options = {})
    serialize_class = serialize_class(data)
    if data.respond_to?(:to_ary)
      data.map { |record| serialize_class.new(record, options).as_json }
    else
      serialize_class.new(data, options).as_json
    end
  end

  def serialize_class(data)
    name = data.respond_to?(:to_ary) ? data.table_name : data.class.name
    name = name.singularize.capitalize + 'Serializer'
    name.constantize
  end
end