 -- IMPACTO DEL KILOMETRAJE EN EL PRECIO
SELECT 
    ROUND(kilometraje/10000)*10000 as rango_km,
    AVG(precio) as precio_promedio,
    COUNT(*) as cantidad
FROM transaccion
GROUP BY rango_km
ORDER BY rango_km;

-- RELACIÓN AÑO-PRECIO 
SELECT 
    anio_manufacturacion,
    AVG(precio) as precio_promedio,
    COUNT(*) as total_ventas
FROM transaccion
GROUP BY anio_manufacturacion
ORDER BY anio_manufacturacion DESC
LIMIT 20; 

 -- RELACION PRECIO/KILOMETRO 
SELECT 
    nombre_modelo,
    CASE 
        WHEN kilometraje < 50000 THEN 'Bajo (0-50k km)'
        WHEN kilometraje BETWEEN 50000 AND 100000 THEN 'Medio (50-100k km)'
        WHEN kilometraje BETWEEN 100000 AND 150000 THEN 'Alto (100-150k km)'
        ELSE 'Muy Alto (+150k km)'
    END as categoria_km,
    AVG(precio) as precio_promedio,
    COUNT(*) as cantidad
FROM transaccion t
JOIN modelo m ON t.Id_modelo = m.id_modelo
GROUP BY nombre_modelo, categoria_km
ORDER BY nombre_modelo, precio_promedio DESC;

-- Modelos con Mejor Retención de Valor
SELECT 
    m.nombre_modelo,
    AVG(t.precio) as precio_promedio,
    AVG(t.kilometraje) as km_promedio,
    COUNT(*) as total_transacciones
FROM transaccion t
JOIN modelo m ON t.Id_modelo = m.id_modelo
GROUP BY m.nombre_modelo
HAVING COUNT(*) > 10
ORDER BY precio_promedio DESC;

