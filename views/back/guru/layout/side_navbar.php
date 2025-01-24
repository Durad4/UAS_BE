<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<?= base_url('assets/dist/img/avatar.png')?>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Dosen</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li>
          <a href="<?= site_url('guru')?>">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>

        <li>
          <a href="<?= site_url('data_siswa')?>">
            <i class="fa fa-archive"></i> <span>Data Siswa</span>
          </a>
        </li>

        <!-- <li>
          <a href="<?= site_url('kelas')?>">
            <i class="fa fa-archive"></i> <span>Laporan Nilai</span>
          </a>
        </li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
