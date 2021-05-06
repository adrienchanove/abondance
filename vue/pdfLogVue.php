<?php
require('libPHP/fpdf.php');

class PDF extends FPDF
{
    // Chargement des données
    function LoadData($file)
    {
        
        
        $data = array();
        global $logs;
        foreach($logs as $line){

            $data[] = array($line['date'],$line['mode'],$line['nom'],$line['nomObjet'],$line['marque'],$line['model'],$line['cout'],$line['nombre'],$line['cout']*$line['nombre']);
        }
        return $data;
    }

    // Tableau simple
    function BasicTable($header, $data)
    {
        // En-tête
        foreach($header as $col)
            $this->Cell(21,7,$col,1);
        $this->Ln();
        // Données
        foreach($data as $row)
        {
            foreach($row as $col)
                $this->Cell(21,6,$col,1);
            $this->Ln();
        }
    }
}

$pdf = new PDF();
// Titres des colonnes
$header = array( 'Date', 'Sens du flux', 'Nom','Nom de l\'objet','Marque','Model','Cout UNIT','Nombre','Cout TOT');
// Chargement des données
$data = $pdf->LoadData('null');
$pdf->SetFont('Arial','',7);
$pdf->AddPage();
$pdf->BasicTable($header,$data);
$pdf->Output();
