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

