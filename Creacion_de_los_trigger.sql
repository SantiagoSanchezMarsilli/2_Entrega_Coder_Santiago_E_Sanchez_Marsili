
--- Trigger

---auditar_venta

```sql
CREATE TRIGGER auditar_venta
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_ventas (
        ID_Ventas,
        Fecha,
        ID_Cliente,
        Vendedor,
        Medio_de_Pago,
        Total,
        Timestamp_Auditoria,
        Origen_Auditoria
    )
    VALUES (
        NEW.ID_Ventas,
        NEW.Fecha,
        NEW.ID_Cliente,
        NEW.Vendedor,
        NEW.Medio_de_Pago,
        NEW.Total,
        NOW(), 
        'Trigger_Auto' 
    );
END;
//

DELIMITER ;
```
--- Trigger auditar_cuota_generada

```sql
DELIMITER //

CREATE TRIGGER auditar_cuota_generada
AFTER INSERT ON cuotas_pago
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_cuotas (ID_Cuota, ID_Medio, Cantidad_Cuotas)
    VALUES (NEW.ID_Cuota, NEW.ID_Medio, NEW.Cantidad_Cuotas);
END //

DELIMITER ;
```