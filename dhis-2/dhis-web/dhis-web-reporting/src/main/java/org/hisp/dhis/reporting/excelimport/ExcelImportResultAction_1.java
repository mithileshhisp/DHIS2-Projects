package org.hisp.dhis.reporting.excelimport;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.opensymphony.xwork2.Action;

/**
 * @author Mithilesh Kumar Thakur
 */
public class ExcelImportResultAction
    implements Action
{
    // -------------------------------------------------------------------------
    // Dependencies
    // -------------------------------------------------------------------------

    // -------------------------------------------------------------------------
    // Input/Output
    // -------------------------------------------------------------------------

    private String message;

    public String getMessage()
    {
        return message;
    }
    
    private InputStream inputStream;

    public InputStream getInputStream()
    {
        return inputStream;
    }

    private String contentType;

    public String getContentType()
    {
        return contentType;
    }

    public void setUploadContentType( String contentType )
    {
        this.contentType = contentType;
    }

    private int bufferSize;

    public int getBufferSize()
    {
        return bufferSize;
    }

    private File file;

    public void setUpload( File file )
    {
        this.file = file;
    }

    private String fileName;

    public String getFileName()
    {
        return fileName;
    }

    public void setUploadFileName( String fileName )
    {
        this.fileName = fileName;
    }

    private List<String> importStatusMsgList = new ArrayList<String>();

    public List<String> getImportStatusMsgList()
    {
        return importStatusMsgList;
    }

    
    // -------------------------------------------------------------------------
    // Action implementation
    // -------------------------------------------------------------------------
    public String execute()
        throws Exception
    {
        message = "";
        System.out.println( "Excel Import --  : " + new Date() );

        //String fileType = fileName.substring( fileName.indexOf( '.' ) + 1, fileName.length() );

        System.out.println( "Excel Import File Name --  : " + fileName );

        String excelFilePath = System.getenv( "DHIS2_HOME" ) + File.separator + fileName;

        file.renameTo( new File( excelFilePath ) );
        moveFile( file, new File( excelFilePath ) );
        
        System.out.println( "File name : " + fileName  );
        String fileType = fileName.substring( fileName.indexOf( '.' ) + 1, fileName.length() );

        
        if ( !fileType.equalsIgnoreCase( "xlsx" ) )
        {
            message = "The file you are trying to import is not an excel file";

            return SUCCESS;
        }

        
       
        
        // Creating a Workbook from an Excel file (.xls or .xlsx)
        Workbook workbook = WorkbookFactory.create( new File( excelFilePath ) );

        // Retrieving the number of sheets in the Workbook
        System.out.println( "Workbook has " + workbook.getNumberOfSheets() + " Sheets : " );

        /*
         * =============================================================
         * Iterating over all the sheets in the workbook (Multiple ways)
         * =============================================================
         */

        // 1. You can obtain a sheetIterator and iterate over it
        Iterator<Sheet> sheetIterator = workbook.sheetIterator();
        System.out.println( "Retrieving Sheets using Iterator" );
        while ( sheetIterator.hasNext() )
        {
            Sheet sheet = sheetIterator.next();
            System.out.println( " => " + sheet.getSheetName() );
        }

        for ( int i = 0; i < workbook.getNumberOfSheets(); i++ )
        {
            System.out.println( " for loop Sheet name: " + workbook.getSheetName( i ) );
        }

        // Getting the Sheet at index zero
        Sheet sheet = workbook.getSheetAt( 0 );

        // Create a DataFormatter to format and get each cell's value as String
        DataFormatter dataFormatter = new DataFormatter();

        // 1. You can obtain a rowIterator and columnIterator and iterate over
        // them
        System.out.println( "\n\nIterating over Rows and Columns using Iterator\n" );
        Iterator<Row> rowIterator = sheet.rowIterator();
        while ( rowIterator.hasNext() )
        {
            Row row = rowIterator.next();

            // Now let's iterate over the columns of the current row
            Iterator<Cell> cellIterator = row.cellIterator();

            while ( cellIterator.hasNext() )
            {
                Cell cell = cellIterator.next();
                String cellValue = dataFormatter.formatCellValue( cell );
                System.out.print( cellValue + "\t" );
            }
            System.out.println();
        }

        // 2. Or you can use a for-each loop to iterate over the rows and
        // columns
        System.out.println( "\n\nIterating over Rows and Columns using for-each loop\n" );

        for ( Row row : sheet )
        {
            for ( Cell cell : row )
            {
                String cellValue = dataFormatter.formatCellValue( cell );
                System.out.print( cellValue + "\t" );
            }
            System.out.println();
        }

        return SUCCESS;
    }
    
    // Supportive Methods
    public int moveFile( File source, File dest ) throws IOException
    {
        if ( !dest.exists() )
        {
            dest.createNewFile();
        }

        InputStream in = null;

        OutputStream out = null;

        try
        {

            in = new FileInputStream( source );

            out = new FileOutputStream( dest );

            byte[] buf = new byte[1024];

            int len;

            while ( (len = in.read( buf )) > 0 )
            {
                out.write( buf, 0, len );
            }
        }

        catch ( Exception e )
        {
            return -1;
        }

        finally
        {
            if ( in != null )
            {
                in.close();
            }
                
            if ( out != null )
            {
                out.close();
            }
                
        }
        return 1;
    }
    
}
