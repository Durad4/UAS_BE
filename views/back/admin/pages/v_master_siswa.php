
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Data Mahasiswa
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?= site_url('admin')?>"><i class="fa fa-dashboard"></i> </a></li>
      </ol>
    </section>
    <section class="content">
        <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            
              <div class="box-body">
              <form>
                <div class="col-sm-2">
                    <select class="form-control input-sm" name="kelas" id="kelas">
                        <option value="" disabled selected hidden>Kelas</option>
                            <?php foreach ($kelas as $row) {
                                echo '<option value="'.$row->nama_kelas.'">'.$row->nama_kelas.'</option>';
                            } ?>
                    </select>
                </div>
                <!-- <div class="col-sm-6">
                  <button class="btn btn-default" onclick="reload_table()"><i class="glyphicon glyphicon-refresh"></i></button>
                  <button class="btn btn-danger" onclick="bulk_delete()"><i class="glyphicon glyphicon-trash"></i> Hapus terpilih</button>
                </div> -->
                <table class="table table-bordered" id="master_siswa">
                      <thead>
                        <tr>
                            <th>NIM</th>
                            <th>Nama</th>
                            <th>Kelas</th>
                            <th>Matakuliah</th>
                            <th>Nilai</th>
                            
                        </tr>
                      </thead>
                </table>
               </form>
            </div>
        </div>

    </section>
</div>

<script type="text/javascript">
    var table;
    
$(document).ready(function() {
    getDataTableSiswa();
    function getDataTableSiswa(kelas){
        table = $('#master_siswa').DataTable({
            'scrollX'    : true,
            'searching'  : false,
            'processing' : true,
            'serverSide' : true,
            'order'      : [],
            oLanguage: {
                sLengthMenu: "_MENU_",
             },
            'ajax'       : {
                url      : site_url + 'back/admin/master_siswa/datatables',
                data     : {
                    kelas : kelas
                }
            },

            responsive   : true,
            'dom'        : '<lf<t>ip>'
        })
    }

    $('#kelas').on('change', function(){
        var kelas = $('#kelas').val();
        if(kelas !== ''){
            $('#master_siswa').DataTable().destroy();
            getDataTableSiswa(kelas);
        }
        else{
            $('#master_siswa').DataTable().destroy();
            getDataTableSiswa();
        }
    });

});
    function reload_table(){
        table.ajax.reload(null,false); //reload datatable ajax 
    } 

    function delete_siswa(nisn){
        if(confirm('Anda Yakin Ingin Menghapus Siswa dan Nilainya?'))
        {
            // ajax delete data to database
            $.ajax({
                url : "<?= site_url('back/admin/master_siswa/ajax_delete/')?>"+nisn,
                type: "POST",
                dataType: "JSON",
                success: function(data)
                {
                    //if success reload ajax table
                    // $('#modal_form').modal('hide');
                    reload_table();
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert('Gagal Hapus Siswa');
                }
            });
    
        }
    }

    function bulk_delete(){
        var list_nisn = [];
        $(".data-check:checked").each(function() {
                list_nisn.push(this.value);
        });
        if(list_nisn.length > 0){
            if(confirm('Are you sure delete this '+list_nisn.length+' data?')){
                $.ajax({
                    type: "POST",
                    data: {nisn:list_nisn},
                    url: "<?= site_url('back/admin/master_siswa/ajax_bulk_delete')?>",
                    dataType: "JSON",
                    success: function(data)
                    {
                        if(data.status)
                        {
                            reload_table();
                        }
                        else
                        {
                            alert('Failed.');
                        }
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown)
                    {
                        alert('Error deleting data');
                    }
                });
            }
        }
        else{
            alert('no data selected');
        }
    }

</script>