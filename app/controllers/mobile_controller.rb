class MobileController < ApplicationController
  before_action :is_adult_logged?, except: [:home, :adult?]

  layout :age_chivas_layout


  def home

  end

  def adult?
    fecha = (params[:birth]['(3i)'] + '-' + params[:birth]['(2i)'] + '-' + params[:birth]['(1i)']).to_date

    if fecha >= 18.years.ago #Menor de edad
      redirect_to home_path, alert: 'Usted es menor de edad. No puede acceder a este sitio.'
    else
      redirect_to "http://www.chivasrd.com/exito/index.html"
      #redirect_to "https://www.chivas.com/es-do"
      session[:is_adult?] = true
    end
  end

  def start

  end

  def semanasanta

  end

 def end

  end

  def participate
    #Buscar codigo en DB
    #Si existe, mostrar mensaje de felicitaciones
    if search_code(params[:code])
      #Buscar cliente
      customer = Customer.find_by identification: params[:identification]
      
      if customer
      register_code(customer.id, params[:code])
      
     #En caso de que no exista el cliente debe ser creado   
      else
        fecha = (params[:birth]['(3i)'] + '-' + params[:birth]['(2i)'] + '-' + params[:birth]['(1i)']).to_s

        customer = Customer.new(
            identification: params[:identification],
            name: params[:name],
            birth: fecha.to_s,
            email: params[:email]
        )

        if customer.save
          register_code(customer.id, params[:code])  
        else
          #redirect_to start_path, customer.errors.full_messages[0]
          redirect_to start_path, alert: "Lo sentimos. Algunos de tus datos ya están registrados en el sistema. (Email o Cédula)"
      end  

      end
    end  
     
  end #END Participate
 

  protected
  def age_chivas_layout
    if action_name == 'home'
      false
    end
  end

  def is_adult_logged?
    unless session[:is_adult?]
      redirect_to home_path
    end
  end

  def register_code (customer_id, code_string)
    customer = Customer.find(customer_id)

    #Upercase todo
      code_flat = code_string.upcase.split.join
      #buscar codigo
      code_result = Code.find_by code: code_flat

      #ASIGNAR CODIGO A CUSTOMER
      if customer.codes << code_result
        code_result.update_attribute( :is_used?, true)

        #Redireaccionar OK
        redirect_to action: :start, anchor: 'inline'
      end
  end

  def search_code (code_string)
    #Upercase todo
      code_flat = code_string.upcase.split.join
      #buscar codigo
      code_result = Code.find_by code: code_flat

      if code_result.nil?
          redirect_to start_path, alert: 'Este código NO existe en el sistema. Por favor verifica tu código y trata de nuevo. Si deseas hablar con nosotros escríbenos a chivasdominicana@gmail.com' and return false
      else
      #si el codigo no ha sido usado y es CHC
        if code_result.is_used? == false && code_result.chivas_code? == true 
          return code_result
          #si el codigo YA HA sido usado y es CHC    
            #elsif code_result.is_used? == true && code_result.chivas_code? == true         
          #Si no encontró el código
        else            
          redirect_to start_path, alert: 'Este código ya fue registrado en el sistema. Si deseas hablar con nosotros escríbenos a chivasdominicana@gmail.com' and return false
        end
      end
  end
end
