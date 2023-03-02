-- GUIA PRACTICA N#2--

/* Ejercicio Práctico a Desarrollar:
Tomando en cuenta la base de datos de la empresa Clear Plus que se desarrollo en la Guía
Práctica #3, realizar un ejemplo aplicando cada una de las consultas JOIN que se han
estructurado en la presente sesión de clase, dejar constancia del lenguaje SQL implementado
por cada una de las consultas realizadas. */

--Inner Join --

select * from cliente as cl
inner join
producto as pro
on cl.compania = pro.descripcion

--LEFT OUTER JOIN--
select * from cliente as izq
left join
producto der
on izq.compania = der.descripcion

-- RIGHT JOIN (Combinacion externa derecha) -- 
select * from  producto  as izq
Right join
cliente der
on der.compania = izq.descripcion


-- FULL JOIN (Como ver las combinaciones de ambos lados)--
select * from  producto  as izq
full join
cliente der
on izq.descripcion = der.compania


--FULL OUTER JOIN--
select * from cliente
select * from producto

select * from cliente as al full outer join producto b1 on al.compania = b1.descripcion

--CROSS JOIN --
select * from cliente
select * from producto

select * from cliente as al full outer join producto b1 on al.compania = b1.descripcion

select * from cliente as al cross join producto b1
