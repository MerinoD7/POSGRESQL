--creando mi base de datos --
create database System1

--creando tablas--
create table planilla (
	idplanilla int primary key not null,
	salario numeric,
	codigoempleado int
)

create table Empleado(
	idempleado int primary key not null,
	nombre varchar(50),
	apellido varchar(50),
	telefono numeric(8),
	correo varchar(40)
)

--agregando llave foranea---
alter table planilla alter column salario type decimal
alter table planilla alter column telefono type numeric

alter table planilla
add constraint fk_empleado foreign key (codigoempleado) references Empleado (idempleado) 

alter table Planilla alter column salario type money

-- Elimando relacion foranea --
Alter Table
DROP CONSTRAIN fk_empleado

--insertando datros a la tabla empleado--
insert into Empleado values (1001, 'Pedro','Fuentes',7777777,'pedrof@system.com');
insert into Empleado values (1002, 'Rosa','Pineda',77774567,'rpineda@system.com');
insert into Empleado values (1003, 'Santiago','Ardon',76787777,'sardon@system.com');
insert into Empleado values (1004, 'Pepe','Perez',74567892,'pperez@system.com')

select * from Empleado

--Insertando datos a la tabla planilla--
insert into planilla values (1,450.00);
insert into planilla values (3,600.00);
insert into planilla values (4,800.00);
insert into planilla values (2,600.00)

select * from planilla

--Creando tabla persona --
create table Persona (
	id_persona int primary key not null,
	nombre varchar(50),
	apellido varchar (50),
	telefono numeric (8),
	correo varchar (40)
)
-- insertando datos a la tabla persona --
insert into Persona values (101, 'Angela', 'Duran','75555555','aduran@system.com');
insert into Persona values (110, 'Pedro', 'Aron','75557755','paron@system.com');
insert into Persona values (107, 'Andre', 'Moran','78885555','amoran@system.com');
insert into Persona values (103, 'Ivan', 'Garcia','70005555','igarcia@system.com')

-- Utilizando Order By --
select * from Persona order by nombre

select * from Persona order by nombre asc

select * from Persona order by nombre desc

select * from Persona order by id_persona asc

select * from Persona order by 2

-- Ordenamiento detallado por columna --

select * from Persona order by nombre desc, id_persona asc


-- Busquedas con Like --

select * from Persona where nombre like '%P%'

select * from Persona where nombre like 'I%'

select * from Persona where nombre like '%e'

select * from Persona where nombre like '%r_'


-- utilizando NOT LIKE --

SELECT * FROM Persona WHERE nombre NOT LIKE 'Pedro%';

SELECT * FROM Persona WHERE apellido NOT LIKE 'Moran%';

/*
También existen los operadores !~~y !~~*que representan NOT LIKEy NOT ILIKE, respectivamente. Todos estos operadores son específicos de PostgreSQL .

Usando el operador NOT Cuando el operador LIKE se combina con el operador NOT, se devuelve cualquier fila que no coincida con el patrón de búsqueda. Por ejemplo, para ver un libro cuyo nombre no comienza con “post”, podemos ejecutar el siguiente comando:*/


--Utilizando Liomit y Offset --

/* Las cláusulas "limit" y "offset" se usan para restringir los registros que se retornan en una consulta "select". */

select * from persona limit 2 offset 0

select * from persona limit 2 offset 2

 select * from persona order by id_persona limit 3


/* Utilizando FETCH --
FETCH permite a un usuario devolver filas usando un cursor.*/

DECLARE persona SCROLL CURSOR FOR SELECT * FROM empleado;

-- Utilizando Funcion STDDEV --

/*La función stddev() acepta una expresión que describe valores de cualquier tipo numérico (numérico, bigint, smallint, real o doble precisión) y devuelve la desviación estándar de los valores dentro de las filas agregadas. El valor resultante se devuelve como precisión doble para una expresión que describe valores de punto flotante y numérico para todos los demás tipos.*/


/* UTILIZANDO LA FUNCION ANY --
"any" y "some" son sinónimos. Chequean si alguna fila de la lista resultado de una subconsulta se encuentra el valor especificado en la condición.

Compara un valor escalar con los valores de un campo y devuelven "true" si la comparación con cada valor de la lista de la subconsulta es verdadera, sino "false".

El tipo de datos que se comparan deben ser compatibles. */

select nombre from persona where apellido like '%Duran%'and
  telefono any

-- UTILIZANDO EXISTS--

 select cliente,numero
  from facturas as f
  where exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');

-- Manejo de función COUNT --
/* A continuación, realizaremos búsquedas utilizado la cláusula count, siempre trabajaremos en
la tabla Persona, creada en la base de datos System: */

-- CONTAR REGISTROS CON COUNT --
	
	select count (*) from persona
	
	select count (nombre) from persona where nombre like '%A%'
	
	select count (nombre) from persona where nombre like '%e%'
	
 --Manejo de función SUM --
/*A continuación, realizaremos suma de registros utilizado la cláusula sum, trabajaremos en la
tabla Planilla, creada en la base de datos System: */

	select *  from planilla
	
	select sum(salario) from planilla


 --Manejo de función AVG--
/* A continuación, sacaremos el promedio de los registros utilizado la cláusula avg,
trabajaremos en la tabla Planilla, creada en la base de datos System: */

select * from planilla
	select avg (salario) from planilla
	
select idplanilla, avg(salario) from planilla group by idplanilla

	-- Manejo de función MAX – MIN --
	select * from planilla
	
	select min(salario) from planilla
	
	select max(salario) from planilla

-- Consultas Join --

select * from empleado
select * from planilla
select * from persona

--Agregando columna nombre a la tabla planilla--
alter table planilla 
add column nombre varchar(50)

--insertando registros a la columna nombre de la tabla planilla

update planilla set nombre = 'Saul Daniel' where idplanilla = 1;
update planilla set nombre = 'Pedro Funes' where idplanilla = 2;
update planilla set nombre = 'Ingrid Merino' where idplanilla = 3;
update planilla set nombre = 'Mario alberto' where idplanilla = 4;
update planilla set nombre = 'Ana Martinez' where idplanilla = 5;

-- union - como hacer una consulta  de dos tablas o mas--
alter table Planilla alter column salario type numeric

select nombre, telefono from empleado 
union 
select nombre, salario from planilla

-- podemos especificar ver el origen de los campos que estamos uniendo en la tabla--
select nombre, telefono, 'empleado' as Origen_Dato from empleado
union
select nombre, salario, 'planilla' from planilla
order by Origen_Dato

-- INNER JOIN (Combinaciones Internas)--
select * from planilla as pl
inner join
empleado as emp
on pl.codigoempleado = emp.idempleado

update planilla set codigoempleado = 2 where idplanilla = 2

-- LEFT JOIN (Combinacion externa izquierda) -- 

select * from planilla as izq
left join
empleado der
on izq.codigoempleado = der.idempleado

-- RIGHT JOIN (Combinacion externa derecha) -- 

select * from planilla as izq
right join
empleado der
on izq.codigoempleado = der.idempleado

-- FULL JOIN (Como ver las combinaciones de ambos lados)--
select * from planilla as izq
full join
empleado der
on izq.codigoempleado = der.idempleado 

-- Como ver registros distintos Ver registros distintos con DISTINCT--
select * from planilla

select distinct salario from planilla

select count (distinct salario) from planilla

--Ver un rango de registros con BETWEEN--
select * from planilla
where salario not between 800 and 1000

-- Restringir los valores en una tabla con UNIQUE--
select * from planilla
Alter table planilla add constraint UQ_salario unique (salario)
insert into planilla values ('10', '450.oo')


--Eliminar una restricción utilizando DROP CONSTRAINT--
select * from planilla
Alter table planilla add constraint UQ_salario unique (salario)
insert into planilla values ('10', '550.oo')

alter table planilla
drop constraint UQ_salario


PARTE FINAL GUIA PRACTICA EJERCICIO APLICATIVO 
--Creando Base de Datos--
Create Database Clear Pluss

--Creando Tabla Cliente --
create table Cliente (
	Id_cliente int primary key not null,
	Compañia varchar(50),
	Telefono numeric (15),
	Mail varchar (50),
	Lim_credito decimal
)

-- Insertando Datos a la Tabla Cliente --
select * from Cliente
alter table Cliente alter column telefono type Varchar(20)

insert into Cliente values (2100,'JPC COmpany',(203)-2587789,'resp@jpc.com',10000000);
insert into Cliente values (2101,'Fist Corp',213-2487789,'',70000);
insert into Cliente values (2102,'ACME Inc',76-2057788,'rivas@acme.com',65000);
insert into Cliente values (2103,'Sanchez & Campos', 250-5978,'Sancamp@hotmail.com',150000);
insert into Cliente values (2104,'ZetaCorp',502-4517890,'compras@Zeta.com',40000);
insert into Cliente values (2105,'Smithson Organization','' ,'Render@smithson.org',100000);
insert into Cliente values (2106,'Jones Mgf',870-7894,'Bill.Jonson@Jones.com',35000);
insert into Cliente values (2107,'Smithsen Company',504-4577800,'',40000);
insert into Cliente values (2108,'McGregor Company',213-4578610,'Francis@Mcgregor.com',60000);
insert into Cliente values (2109,'Smith Inc',205-13245440,'',50000)

--Creando Tabla Pedido --
create table Pedido(
	Num_orden int primary key not null,
	Fecha date,
	Id_cliente int,
	Id_Resp int,
	Total numeric

)

alter table Pedido
add constraint fk_Cliente foreign key (Id_cliente) references Cliente (Id_cliente) 

--Agregando Datos a la Tabla Pedido--
select * from Pedido

insert into Pedido values (01,'10/12/2023',2101,1001);
insert into Pedido values (02,'10/12/2023',2107,1002);
insert into Pedido values (03,'15/01/2023',2106,1003);
insert into Pedido values (04,'23/03/2023',2105,1005);
insert into Pedido values (05,'04/05/2023',2109,1001)

--Creando la Tabla Detalles de Pedido--
create table Detalle_Pedido(
	Num_orden int,
	Id_Prod int primary key not null,
	Cantidad numeric
)

alter table Detalle_Pedido
add constraint fk_Pedido foreign key (Num_orden) references Pedido (Num_orden)

--Insertando Datos a la Tabla Detalle Pedido--
select * from Detalle_Pedido
ALTER TABLE Detalle_Pedido DROP CONSTRAINT Detalle_Pedido_pkey
  
alter table Detalle_Pedido alter column Id_Prod type varchar(15)

insert into Detalle_Pedido values(01,00108,50)
insert into Detalle_Pedido values(01,'P-00100',20)
insert into Detalle_Pedido values(01,'P-00101',75);
insert into Detalle_Pedido values(02,'P-00105',40);
insert into Detalle_Pedido values(02,'P-00110',25);
insert into Detalle_Pedido values(03, 'P-00109',60);
insert into Detalle_Pedido values(03,'P-00101',120);
insert into Detalle_Pedido values(03,'P-00102',40);
insert into Detalle_Pedido values(03,'P-00104',75);
insert into Detalle_Pedido values(04,'P-00103',50);
insert into Detalle_Pedido values(04,'P-00106',65);
insert into Detalle_Pedido values(04,'P-00107',30);
insert into Detalle_Pedido values(05,'P-00103',45);
insert into Detalle_Pedido values(05,'P-00104',70);
insert into Detalle_Pedido values(05,'P-00105',150);
insert into Detalle_Pedido values(05,'P-00102',110)


--CRENADO TABLA PRODUCTO--

create TABLE Producto(
	id_producto int Primary key not null,
	descripcion varchar(25),
	Precio_compra numeric,
	precio_venta numeric,
	existencia numeric,
	Proveedor varchar(10)

)

alter table Producto
add constraint fk_Proveedor foreign key (Proveedor) references Proveedor (id_proveedor)

alter table Producto alter column id_producto type varchar(15)

--INSERTANDO DATOS A LA TABLA PRODUCTO--
select * from Producto

insert into Producto values('P-00100','PC Compaq',10000,14000,525,'COM')
insert into Producto values('P-00101','Impresora Laser Compaq',5000,7000,150,'COM');
insert into Producto values('P-00102','Fotocopiadora',200000,275000,150,'XER');
insert into Producto values('P-00103','Proyector de cañon',30000,45000,200,'EPS');
insert into Producto values('P-00104','PC Modelo 305 1.4 Ghz',7000,9000,200,'ACI');
insert into Producto values('P-00105','Impresor Canon 4000',500,750,350,'CAN');
insert into Producto values('P-00106','UPS',900,1300,500,'MOI');
insert into Producto values('P-00107','Impresora Laser Epson',5000,7500,120,'EPS');
insert into Producto values('P-00108','Fotocpiadora Mod 352',75000,100000,100,'XER');
insert into Producto values('P-00109','Escritorio de Oficina',15000,20000,75,'ACI');
insert into Producto values('P-10110','Aire Acondcionado',12500,17500,756,'MOI')

--CREANDO  TABLA PROVEEDOR--

Create Table Proveedor (
	Id_proveedor varchar(5) primary key not null,
	Nombre varchar(25),
	Telefono varchar(15)

)


--INSERTANDO DATOS A La TABLA PROVEEDOR--
Select * from Proveedor

insert into Proveedor values('ACI','Asia Corp International','254-1466');
insert into Proveedor values('MOI','Moore Inc','258-4578');
insert into Proveedor values('XER','Xerox International','228-7845');
insert into Proveedor values('CAN','Cannon','(513)-451288');
insert into Proveedor values('COM','Compaq','(504)-2587463');
insert into Proveedor values('EPS','EPSON','(213)-4578912')

--CREANDO LA TABLA SUCURSALES --

create table Sucursales (
	id_oficina serial primary key not null,
	Direccion varchar(50),
	Telefono varchar(12)
)

--INSERTANDO DATOS A LA TABLA SUCURSALES--

Select * from Sucursales

insert into Sucursales values(100,'75 calle Pte. #3433 San Salvador','225-0188')
insert into Sucursales (Direccion, Telefono) values('10 AV Nte. #2001 Santa Ana','440-4145')
insert into Sucursales (Direccion, Telefono) values('5 C Pte. #401 Usulutan','630-7844');
insert into Sucursales (Direccion, Telefono) values('27 Av Sur #301 Sonsonate','451-8733');
insert into Sucursales (Direccion, Telefono) values('13 C Ote. #28-4 San Miguel','661-6231')

--CREANDO LA TABLA VENDEDORES--
create table Vendedores (
	id_emp int primary key not null,
	Nombre varchar(15),
	id_oficina int,
	fec_contrato date,
	Venta_minima decimal,
	venta_neta money
)

alter table Vendedores
add constraint fk_id_oficina foreign key (id_oficina) references Sucursales (id_oficina)

--INSERTANDO DATOS A LA TABlA VENDEDORES--

insert into Vendedores values(1001,'Bill Adams',100,'12/01/2001',150000,225000);
insert into Vendedores values(1002,'Willhem Davison',100,'12/01/2001',200000,175000);
insert into Vendedores values(1003,'Raul Rodriguez',1,'21/02/2001',250000,205000);
insert into Vendedores values(1004,'Francisco Armau',2,'23/04/2001',275000,150000);
insert into Vendedores values(1005,'Sue Smith',2,'24/04/2001',150000,125000);
insert into Vendedores values(1006,'Charles Moore',3,'30/06/2001',200000,102000);
insert into Vendedores values(1007,'Mary Jones',4,'23/08/2001',150000,175000)

--1. Calcular el total de Ventas Minimas y Ventas Maximas de los empleados

SELECT SUM(Venta_minima) AS Total_Venta_Minima, SUM(venta_neta) AS Total_Venta_Neta FROM Vendedores;

--2.¿Cual es el total de los pedidos tomados por "Bill Admas"--

SELECT * FROM Pedido where Id_resp like '%1001i%';

--3.¿Cual es el precio de compra promedio de los productos distribuidos por ACI? --

SELECT AVG(precio_compra) AS Precio_compra_promedio
FROM producto
WHERE proveedor = 'ACI';

--4.Contar el número de Vendedores que han sobrepasado su venta mínima.--

SELECT COUNT(*) 
FROM Vendedores 
WHERE venta_neta > Venta_minima AND id_emp IN (
    SELECT id_emp 
    FROM Vendedores 
    WHERE venta_neta > Venta_minima
)

--5.. Contar el número de Clientes que posee la empresa.--

SELECT COUNT(*) FROM cliente;

--6.. Seleccione número de pedido y nombre del producto de aquellos pedidos cuya cantidad este entre 100 y 200.--
SELECT d.Num_orden, p.descripcion
FROM Detalle_Pedido d
JOIN Producto p ON d.Id_Prod = p.id_producto
WHERE d.Cantidad BETWEEN 100 AND 200;

--7.Seleccione compañía y límite de crédito de los clientes cuyo nombre inicie con “Smith”.
SELECT Compañia, Lim_credito 
FROM Cliente 
WHERE Compañia LIKE 'Smith%';
