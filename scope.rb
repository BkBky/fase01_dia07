# variable global
$local_var = "this is my local var"

# variable global
$global_var = "This is a global variable"

# constante global
CONSTANT = 3.1416 

# Este es un getter
def global_var
  $global_var  
end

# Este es un setter
def global_var=(var)
  $global_var = var
end

# método getter para una constante sí es válido
def constant
  CONSTANT  
end

# Este metodo quedó comentado por que la terminal nos dijo que no lo podemos modificar 'dynamic constant assignment'
# def constant=(cons)
#   CONSTANT = cons
# end

class DummyClass
  #attr_accessor :dummy_1, :dummy_2
  @@class_variable = "This is a class variable"
  

  def initialize(dummy1, dummy2)
    @instance_var = $local_var
    @instance_var
    @dummy_1 = dummy1
    @dummy_2 = dummy2
  end

  def return_my_local_var    
    $local_var = "cambiando variable" # Variable global fue leida dentro de este metodo. Y aqui fue posible asignar un nuevo valor
    # la variable global  puede se llamada en cualquier lugar, la variable de clase, sólo vive en e la clase misma.
  end
  #puts return_my_local_var
  def class_variable
    @@class_variable
  end

  # Este es un setter
  def class_variable=(value)
     @@class_variable = value    
  end

  # Este es un getter
  def instance_var
    @instance_var
  end

  # Este es un setter
  def instance_var=(value)
    @instance_var = value
  end
  
  # Este es un getter
  def global_var
    $global_var  
  end
  
  # Este es un setter
  def global_var=(var)
    $global_var = var
  end

  # Este es un getter
  def constant
    CONSTANT  
  end
  # Este metodo quedó comentado por que la terminal nos dijo que no lo podemos modificar 'dynamic constant assignment'
  # def constant1=(cons)
  #   CONSTANT = cons
  # end

end


dummy_class = DummyClass.new("hola1", "hola2")
dummy_1 = DummyClass.new("libro1", "libro2")
dummy_2 = DummyClass.new("casa1", "casa2")


puts dummy_class.return_my_local_var
p dummy_class.instance_var=("Bar")

p dummy_1.class_variable=("New value for the class variable")
# Si a dummy_2 lo sobreescribimos nuevamente  "otro valor" , entonces las siguientes llamadas de dummy_1 y dummy_2, se van a modificar con "otro valor" 
p dummy_2.class_variable#=("otro valor")
p dummy_1.class_variable #== "New value for the class variable"
p dummy_2.class_variable #== "New value for the class variable"

# llamada al "global_var" y "constant" desde el alcance global
p "#{global_var} - interpolado/ llamda del método getter"
p "#{constant} - interpolado/ llamada del método getter"

# Método setter para global var en el alcance global
p global_var=("modificación de variable global, desde el alcance global")

# Llamada a "global_var" y "contant" desde el alcance de la clase
p dummy_1.global_var
p dummy_1.constant

# Método setter desde el alcance de la clases
p dummy_1.global_var=("llamada desde a variable de instancia global")

#Lamamos nuevamente global_var desde el alcalce global y vemos que no es el mismo valor que el llamado anterior.
p global_var


# p dummy_1.class_variable=("otro valor")
# p dummy_2.class_variable=("otro valor2")


# p dummy_class.dummy_1
# dummy_class.dummy_1 = ("otro valor")
# p dummy_class.dummy_1






