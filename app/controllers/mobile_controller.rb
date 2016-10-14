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
      redirect_to start_path
      session[:is_adult?] = true
    end



  end

  def start
    @ganadores = Winner.all

  end


  def participate
    customer = Customer.find_by identification: params[:identification]

    #Si el cliente existe
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
      end  
    end

        #REdirecccion final despues de registrar customer y codigo
        if customer.save
          redirect_to action: :start, anchor: 'inline'
        else
          return false, alert: "Lo sentimos. No has podido ser registrado en la aplicación. Revisa tus datos e intenta de nuevo"
        end
    

  end


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

      #si el codigo es de CHIVAS o es correcto,crea la asociacion
        if code_result
          #Si el codigo no ha sido usado, asignar
          if code_result.is_used? == false && code_result.chivas_code? == true 
            #ASIGNAR CODIGO A CUSTOMER
            if customer.codes << code_result
              code_result.update_attribute( :is_used?, true)
            end
          else
            redirect_to start_path, alert: 'Lo sentimos, este código no es válido, debido a que no existe o ya fue registrado'
            return false
          end

        #En caso de que no sea de cHIVAS el code, debo crear uno tipo registro
        else
          #Crear code NO VALIDO de customer para historial
          customer.codes.create!(code: code_flat, is_used?: true)
        end

  end


end
