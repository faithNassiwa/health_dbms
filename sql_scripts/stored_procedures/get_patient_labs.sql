USE `hospital`;
DROP procedure IF EXISTS `hospital`.`get_patient_lab_results`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patient_lab_results`(
IN patient_id INT
)
BEGIN
    SElECT l.name as 'Lab Test', v.visit_date AS 'Test Taken On', plt.test_results As 'Lab Results', plt.performed_on As 'Result Date'
    FROM laboratory_test l, performs_lab_test plt, visit v
    WHERE l.id = plt.laboratory_test_id AND plt.visit_id = v.id AND v.patient_id = patient_id ORDER BY 'Test Taken On' DESC;
END$$

DELIMITER ;