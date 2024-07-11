require 'csv'
require 'prawn/table'

class PagesController < ApplicationController
    # index is a public page
    def index
        @empresa = Empresa.includes(:empleados)
    end

    def new
        @empresa = Empresa.new
        @empresa.empleados.build
    end

    def create
        @empresa = Empresa.new(empresa_params)

        if @empresa.save
            redirect_to pages_path, notice: "Registro creado exitosamente"
        else
            render :new
        end
    end

    def destroy
        @empresa = Empresa.find(params[:id])
        @empresa.destroy
        redirect_to pages_path, notice: "Empresa ha sido eliminada"
    end

    def show
        @empresa = Empresa.includes(:empleados)
    end

    def edit
        @empresa = Empresa.find(params[:id])
    end

    def update
        @empresa = Empresa.find(params[:id])
        if @empresa.update(empresa_params)
            @empresa.save
            redirect_to pages_path, notice: 'Datos han sido actualizados'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def export_csv
        @empresa= Empresa.find(params[:id])
        csv_data = CSV.generate do |csv|
            csv << ["Bussiness Name", "Name", "Last Name", "Department", "Manager", "Phone line"]
            @empresa.empleados.each do |empleado|
                csv << [@empresa.nombre, empleado.nombre, empleado.apellido, empleado.departamento, empleado.responsable_area, empleado.extension]
            end    
        end
        send_data csv_data, filename: "Reporte.csv"    
    end
    
    def export_pdf
      @empresa= Empresa.find(params[:id])
      respond_to do |format|
        format.pdf do
          pdf = Prawn::Document.new

          logo_path = Rails.root.join('app', 'assets', 'images', 'logo.jpeg')

          if File.exist?(logo_path)
            pdf.image logo_path, width: 50, height: 50, position: :right
          else
            pdf.text "Logo no encontrado", color: "FF0000"  
          end

          pdf.text "Reporte de empleados para empresa #{@empresa.nombre}", size: 20, style: :bold
          pdf.move_down 10
          pdf.text "Fecha del Reporte: #{Time.zone.now.strftime('%d/%m/%Y %H:%M')}", align: :right

          data = [['Name', 'Last name', 'Department', 'Manager', 'Phone line']]
            
          @empresa.empleados.each do |empleado|
            data << [empleado.nombre, empleado.apellido, empleado.departamento, empleado.responsable_area, empleado.extension]
          end

          pdf.table(data, header: true, row_colors: ['dddddd', 'ffffff'], position: :center, width: pdf.bounds.width) do
            cells.border_width = 1
            cells.border_color = '000000'
            row(0).font_style = :bold
            self.header = true
          end

          send_data pdf.render, filename: 'reporte.pdf', type: 'application/pdf', disposition: 'inline'  
        end 
      end      
    end    

    private
    def empresa_params
        params.require(:empresa).permit(:nombre, empleados_attributes: [:id, :nombre, :apellido, :departamento, :responsable_area, :extension])
    end   
end