require 'tree'
filename = ARGV.first
file = File.open(filename)
out = File.open("result.out","w")

test_cases = file.readline.chomp.to_i

for i in (0..(test_cases-1))



  n_and_m = file.readline.chomp.split.map(&:to_i)
  n = n_and_m.first
  m = n_and_m.last
  
  created = 0

  #fill up with the directories that already exist
  cur_dirs = Array.new
  #puts "Setting @root again"
  @root = Tree::TreeNode.new('@root','/')
  
  for j in (0..(n-1))
    
    path_els = file.readline.chomp.split("/")
    path_els.delete("")
    
    last = @root #the last will always be the @root
    
    for k in (0..(path_els.size-1))
      name = "#{path_els[k].to_s}-#{k}-#{last.level}"
      newChild = Tree::TreeNode.new(name,name)
      
      #puts "#{last}"
      if last.is_leaf? then
        last << newChild
        last = last[name]
      else
        is_included = false
        for child in last.children
          if child.name == name then
            is_included = true
          end
        end
        if is_included == false then
          last << newChild
          last = last[name]
        else
          last = last[name]
        end
      end
    end  
  end
  
  created = @root.size
  
  for j in (0..(m-1))
    
    path_els = file.readline.chomp.split("/")
    path_els.delete("")
    
    last = @root #the last will always be the @root
    #puts "Siguiendo linea #{path_els} - size #{path_els.size}"
    for k in (0..(path_els.size-1))
      name = "#{path_els[k].to_s}-#{k}-#{last.level}"
      newChild = Tree::TreeNode.new(name,name)
      if last.is_leaf? then
        last << newChild
        last = last[name]
      else
        is_included = false
        for child in last.children
          #puts "Included? #{name} and child name is #{child.name}"
          if child.name == name then
            is_included = true
          end
        end
        if is_included == false then
          last << newChild
          last = last[name]
        else
          last = last[name]
        end
      end
      #puts "Nivel actual #{last.level}"

    end
  end

  remaining = @root.size
  
out.write("Case ##{i+1}: #{remaining-created}\n")
  
end

file.close
out.close

