class NilClass

  # Returning an empty array is usally semantically correct
  # and avoids unecessary checks when you don't care whether
  # a collection is nil.
  # 
  def each
    []
  end
end
