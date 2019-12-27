package org.hisp.dhis.reporting.excelimport;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hisp.dhis.category.CategoryOptionCombo;
import org.hisp.dhis.category.CategoryService;
import org.hisp.dhis.dataelement.DataElement;
import org.hisp.dhis.dataelement.DataElementService;
import org.hisp.dhis.datavalue.DataValue;
import org.hisp.dhis.datavalue.DataValueService;
import org.hisp.dhis.organisationunit.OrganisationUnit;
import org.hisp.dhis.organisationunit.OrganisationUnitService;
import org.hisp.dhis.period.Period;
import org.hisp.dhis.period.PeriodService;
import org.hisp.dhis.period.PeriodType;
import org.hisp.dhis.user.CurrentUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

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

    @Autowired
    private PeriodService periodService;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private DataElementService dataElementService;
    
    @Autowired
    private CurrentUserService currentUserService;
    
    @Autowired
    private OrganisationUnitService organisationUnitService;
    
    @Autowired
    private DataValueService dataValueService;
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

    private Map<String, Integer> orgUnitMappingMap = new HashMap<String, Integer>();
    private Map<String, Integer> dataElementsMappingMap = new HashMap<String, Integer>();
    private Map<String, Integer> categoryOptionComboMap = new HashMap<String, Integer>();
    
    // -------------------------------------------------------------------------
    // Action implementation
    // -------------------------------------------------------------------------
    public String execute()
        throws Exception
    {
        message = "";
        importStatusMsgList = new ArrayList<String>();

        System.out.println( "File name : " + fileName + " import Start " + new Date() );
        String fileType = fileName.substring( fileName.indexOf( '.' ) + 1, fileName.length() );

        
        if ( !fileType.equalsIgnoreCase( "xlsx" ) )
        {
            message = "The file you are trying to import is not an excel file";

            return SUCCESS;
        }
        
        initializeDataElementMap();
        initializeCategoryOptionComboMap();
        initializeOrgUnitMap();
        String storedBy = currentUserService.getCurrentUsername();
        
        XSSFWorkbook workBook = new XSSFWorkbook ( file );
        // Return first sheet from the XLSX workbook
        XSSFSheet sheet = workBook.getSheetAt(0);
        // Create a DataFormatter to format and get each cell's value as String
        DataFormatter dataFormatter = new DataFormatter();
        
        for ( int i = 0; i < workBook.getNumberOfSheets(); i++ )
        //for ( int i = 0; i < 1; i++ )
        {
            System.out.println( " Import for Sheet name: " + workBook.getSheetName( i ) );
            
            Period period = new Period();
            Integer periodId = null;
            String isoPeriod = null;
            if( workBook.getSheetName( i ) != null && !workBook.getSheetName( i ).equalsIgnoreCase( "" ) )
            {
                isoPeriod = workBook.getSheetName( i );
                period = PeriodType.getPeriodFromIsoString( isoPeriod );
                if( period != null )
                {
                    period = periodService.reloadPeriod( period );
                    periodId = period.getId();
                }
                if( period == null )
                {
                    importStatusMsgList.add( "Sheet Name - " + workBook.getSheetName( i ) +  " not a valid sheet name "  );
                    continue;
                }
                
                Sheet tempSheet = workBook.getSheetAt( i );
                Map<Integer, String> orgUnitMap = new HashMap<Integer, String>();
                
                for( int j = 1 ; j<2; j++ )
                {
                    Row orgUnitRow = tempSheet.getRow( j );
                    
                    for( int k = 5 ; k<orgUnitRow.getPhysicalNumberOfCells(); k++ )
                    {
                        Cell orgUnitCell = orgUnitRow.getCell( k );
                        String orgUnitUid = dataFormatter.formatCellValue( orgUnitCell );
                        if( orgUnitUid != null && !orgUnitUid.equalsIgnoreCase( "" ) )
                        {
                            orgUnitMap.put( k, orgUnitUid );
                        }
                    }
                }
                
                for( int j = 2 ; j<tempSheet.getPhysicalNumberOfRows(); j++ )
                //for( int j = 2 ; j<3; j++ )
                {
                    Row dataRow = tempSheet.getRow( j );
                    
                    Cell deUid = dataRow.getCell( 1 );
                    Cell cocUid = dataRow.getCell( 4 );
                    
                    DataElement dataElement = new DataElement();
                    CategoryOptionCombo currentOptionCombo = new CategoryOptionCombo();
                    
                    if( deUid != null && !dataFormatter.formatCellValue( deUid ).equalsIgnoreCase( "" ) )
                    {
                        dataElement = dataElementService.getDataElement( dataFormatter.formatCellValue( deUid ) );
                    }
                    
                    if( cocUid != null && !dataFormatter.formatCellValue( cocUid ).equalsIgnoreCase( "" ) )
                    {
                        currentOptionCombo = categoryService.getCategoryOptionCombo( dataFormatter.formatCellValue( cocUid ) );
                    }
                    
                    if( dataElement != null && currentOptionCombo != null )
                    {
                        for( int k = 5 ; k < dataRow.getPhysicalNumberOfCells(); k++ )
                        {
                            String orgUnitUid = orgUnitMap.get( k );
                            OrganisationUnit orgUnit = organisationUnitService.getOrganisationUnit( orgUnitUid );
                            
                            Cell dataValueCell = dataRow.getCell( k );
                            
                            String dataCellValue = dataFormatter.formatCellValue( dataValueCell );
                            if( dataCellValue != null && !dataCellValue.equalsIgnoreCase( "" ) )
                            {
                                DataValue dataValue = new DataValue();

                                dataValue.setDataElement( dataElement );

                                dataValue.setPeriod( period );
                                dataValue.setSource( orgUnit );
                                
                                dataValue.setCategoryOptionCombo( currentOptionCombo );
                                //.setOptionCombo( currentOptionCombo );
                                
                                //dataValue.setTimestamp( new Date() );
                                dataValue.setLastUpdated(  new Date() );
                                dataValue.setStoredBy( storedBy );
                                dataValue.setValue( dataCellValue );
                                
                                DataValue oldValue = new DataValue();

                                //oldValue = dataValueService.getDataValue( currentOrgUnit, currentDataElement, selectedPeriod, currentOptionCombo );
                                oldValue = dataValueService.getDataValue( dataElement, period, orgUnit, currentOptionCombo );

                                if ( oldValue == null )
                                {
                                    try
                                    {
                                        dataValueService.addDataValue( dataValue );
                                        
                                        importStatusMsgList.add( "Sheet Name - " + workBook.getSheetName( i ) +  " Row No - " + j + " Col No - " + k + ". is succuessfully imported with value - "  + dataValue.getValue()  );
                                    }
                                    catch ( Exception ex )
                                    {
                                        //throw new RuntimeException( "Cannot add datavalue", ex );
                                        message = "Exception occured while import, please check log for more details" + ex.getMessage();
                                        importStatusMsgList.add( "Sheet Name - " + workBook.getSheetName( i ) +  " Row No - " + j + " Col No - " + k  + " --" + message );
                                    }
                                }
                                //else if ( oldValue != null && (!riRadio.equalsIgnoreCase( "reject" )) )
                                else if ( oldValue != null )
                                {
                                    try
                                    {
                                        oldValue.setValue( dataCellValue );
                                        //oldValue.setTimestamp( new Date() );
                                        oldValue.setLastUpdated(  new Date() );
                                        oldValue.setStoredBy( storedBy );

                                        dataValueService.updateDataValue( oldValue );
                                        
                                        importStatusMsgList.add( "Sheet Name - " + workBook.getSheetName( i ) +  " Row No - " + j + " Col No - " + k + ". is succuessfully updated with value - "  + dataCellValue );
                                        //System.out.println( "DE id : " + currentDataElement.getId() + " Period id: " + selectedPeriod.getId()  + " Source id : " + currentOrgUnit.getId() +  " : " + cellContent + " -- Value updated in dataValue ");
                                        
                                    }
                                    catch ( Exception e )
                                    {
                                        //throw new RuntimeException( "Cannot add datavalue", ex );
                                        message = "Exception occured while import, please check log for more details" + e.getMessage();
                                        importStatusMsgList.add( "Sheet Name - " + workBook.getSheetName( i ) +  " Row No - " + j + " Col No - " + k  + " --" + message );
                                    }
                                }
                            }
                        }
                    }
                    if( dataElement == null || currentOptionCombo == null )
                    {
                        //message = "Sheet Name - " + workBook.getSheetName( i ) +  " not a valid sheet name ";
                        importStatusMsgList.add( "Sheet Name - " + workBook.getSheetName( i ) +  " Row No - " + j +  " -- dataElement or currentOptionCombo not valid " );
                        continue;
                    }
                    
                }
            }
            
            //Row row = sheet0.getRow( tempRowNo );
            //Cell cell = row.getCell( tempColNo );
            //cell.setCellValue( Double.parseDouble( tempStr ) );
            

            
            /*
            
            for ( Row row : sheet )
            {
                
                for ( Cell cell : row )
                {
                    //row.getRowNum()
                    
                    
                    if( row.getRowNum() == 2 && cell.getColumnIndex() >= 4 )
                    {
                        String orgUnitUid = dataFormatter.formatCellValue( cell );
                        if( orgUnitUid != null && !orgUnitUid.equalsIgnoreCase( "" ) )
                        {
                            
                        }
                    }
                    
                    String cellValue = dataFormatter.formatCellValue( cell );
                    
                    System.out.print( "Row No - " + row.getRowNum() + " Cell Index -- " + cell.getColumnIndex() + "-- " + cellValue + "\t" );
                }
                System.out.println();
            }
            */
            
        }
        
        System.out.println( "File name : " + fileName + " import End " + new Date() );
        return SUCCESS;
    }
    public void initializeOrgUnitMap()
    {
        orgUnitMappingMap = new HashMap<String, Integer>();
        try
        {
            String query = " SELECT uid, organisationunitid, name from organisationunit ";
            //System.out.println( "query = " + query );
            SqlRowSet rs = jdbcTemplate.queryForRowSet( query );

            while ( rs.next() )
            {
                String orgUnitUID = rs.getString( 1 );
                Integer orgUnitId = rs.getInt( 2 );
                if( orgUnitUID != null && orgUnitId != null  )
                {
                    orgUnitMappingMap.put( orgUnitUID, orgUnitId );
                }
            }
        }
        catch ( Exception e )
        {
            e.printStackTrace();
        }
    }
    
    public void initializeDataElementMap()
    {
        dataElementsMappingMap = new HashMap<String, Integer>();
        try
        {
            String query = " SELECT uid,dataelementid, name from dataelement; ";
            //System.out.println( "query = " + query );
            SqlRowSet rs = jdbcTemplate.queryForRowSet( query );

            while ( rs.next() )
            {
                String deUID = rs.getString( 1 );
                Integer deId = rs.getInt( 2 );
                if( deUID != null && deId != null  )
                {
                    dataElementsMappingMap.put( deUID, deId );
                }
            }
        }
        catch ( Exception e )
        {
            e.printStackTrace();
        }
    }
    
    public void initializeCategoryOptionComboMap()
    {
        categoryOptionComboMap = new HashMap<String, Integer>();
        try
        {
            String query = " SELECT uid,categoryoptioncomboid, name from categoryoptioncombo; ";
            //System.out.println( "query = " + query );
            SqlRowSet rs = jdbcTemplate.queryForRowSet( query );

            while ( rs.next() )
            {
                String cocUID = rs.getString( 1 );
                Integer cocId = rs.getInt( 2 );
                if( cocUID != null && cocId != null  )
                {
                    categoryOptionComboMap.put( cocUID, cocId );
                }
            }
        }
        catch ( Exception e )
        {
            e.printStackTrace();
        }
    }    
    
}
