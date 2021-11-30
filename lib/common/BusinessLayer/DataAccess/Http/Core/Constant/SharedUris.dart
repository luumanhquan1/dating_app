class SharedUris {
  static const String get_qlnv_get_don_vi = '/qlnv/thu-hoi/get-don-vi-thu-hoi';
  static const String get_all_phuong_thuc_nhan =
      '/danh-muc/getallphuongthucnhan';
  static const String nhiemvu_don_doc = '/qlnv/nhiem-vu/don-doc';
  static const String nhiemvu_details = '/qlnv/cong-viec/chitiet';
  static const String nhiemvu_assign_cong_viec =
      '/qlnv/cong-viec/assigncongviec';
  static const String nhiemvu_get_muc_do_cong_viec =
      '/qlnv/cong-viec/get-muc-do-cong-viec';
  static const String nhiemvu_dsdonvigancv = '/qlnv/cong-viec/dsdonvigancv';
  static const String nhiemvu_current_task = '/qlnv/nhiem-vu/get-current-task';
  static const String nhiemvu_thu_hoi = '/qlnv/thu-hoi/thu-hoi';
  static const String congViec_history_giao_viec =
      '/qlnv/cong-viec/lichsugiaoviec';
  static const String opinion = '/ho-so-cong-viec/y-kien';
  static const String congViec_history_thay_doi_trang_thai =
      '/qlnv/cong-viec/lichsuthaydoitrangthai';
  static const String hoSoCongViec_get_tree_don_vi =
      '/ho-so-cong-viec/get-tree-don-vi';
  static const String getId = '/verify-token-qlnv';
  static const String get_can_bo_multi = '/can-bo/get-multi';
  static const String can_bo_update_anh = '/can-bo/update-anh';
  static const String authen = '/auth/login';
  static const String set_current_can_bo = '/auth/setcurrentdonvi';
  static const String get_curren_don_vi = '/auth/getdonvicurrentuser';
  static const String get_pham_vi = '/auth/get-pham-vi';
  static const String menu_vb_den = '/danh-muc/getalltrangthai';
  static const String menu_vb_di = '/van-ban-di/so-luong';
  static const String menu_hscv = '/ho-so-cong-viec/count';
  static const String danh_sach_vb = '/vanban/getdanhsachvanban';
  static const String danh_sach_vb_lien_quan_paging = '/vanban/timkiempaging';
  static const String vb_den_detail = '/VanBan/ChiTietVanBanDen';
  static const String get_all_don_vi =
      '/qlvb/van-ban-den/phan-xu-ly/get-all-don-vi';
  static const String lich_su_phan_xu_ly = 'phan-xu-ly/getbynhiemvupaging';
  static const String get_don_vi_tree =
      '/qlvb/van-ban-den/phan-xu-ly/get-tree-don-vi';
  static const String get_list_lanhdao =
      '/qlvb/van-ban-den/phan-xu-ly/get-lanh-dao';
  static const String get_list_work_group =
      '/qlvb/van-ban-den/phan-xu-ly/get-nhom-lam-viec';
  static const String get_list_don_vi_xl =
      '/qlvb/van-ban-den/phan-xu-ly/get-don-vi-xu-ly';
  static const String xem_lich_su_cap_nhat = 'xem-lich-su-cap-nhat';
  static const String xem_lich_su_tra_lai = 'xem-lich-su-tra-lai';
  static const String xem_lich_su_thu_hoi = 'xem-lich-su-thu-hoi';
  static const String xem_lich_su_huy_duyet = 'xem-lich-su-huy-duyet';
  static const String xem_lich_su_luong_xu_ly = 'xem-lich-su-luong-xu-ly';
  static const String lich_su_theo_doi_van_ban = 'lich-su-theo-doi-van-ban';
  static const String send_document_process_data =
      '/qlvb/van-ban-den/phan-xu-ly/phan-xu-ly';
  static const String get_lanh_dao_da_xl =
      '/qlvb/van-ban-den/phan-xu-ly/get-lanh-dao-da-bao-cao';
  static const String get_config = '/config/search';
  static const String danh_sach_vb_di = '/van-ban-di/search';
  static const String delete_vb_di = '/van-ban-di';
  static const String thu_hoi_vb = '/thuhoi/GetDanhSachThuHoi';
  static const String tinh_hinh_thuc_hien_paging =
      'nhiem-vu/tinh-hinh-thuc-hien-paging/';
  static const String thu_hoi = '/thuhoi/ThuHoi';
  static const String check_in_charge = '/vanban/can-bo-in-charge';
  static const String confirm_document = '/vanban/cap-nhat-hoan-thanh';
  static const String don_vi_ban_hanh = '/van-ban-di/don-vi-da-ban-hanh';
  static const String van_ban_di_so_luong = '/van-ban-di/so-luong';
  static const String van_ban_den_so_luon = '/danh-muc/dashboard-van-ban-den';
  static const String danh_sach_nhiem_vu_don_vi = '/qlnv/nhiem-vu/get-all';
  static const String list_cong_viec_ca_nhan =
      '/qlnv/cong-viec/danhsachcongvieccanhan';
  static const String lich_su_tra_lai_pagig =
      'nhiem-vu/lich-su-tra-lai-paging/';
  static const String them_van_ban_cap_nhat_tinh_hinh_lien_quan =
      '/qlnv/van-ban-lien-quan/them-van-ban-cap-nhat-tinh-hinh-thuc-hien';
  static const String lich_su_thu_hoi_paging = 'thu-hoi/lich-su-thu-hoi-paging';
  static const String lich_su_don_doc_paging =
      'nhiem-vu/lich-su-don-doc-paging';
  static const String phan_xu_ly_nhiem_vu = '/qlnv/phan-xu-ly/phan-xu-ly';
  static const String nv_da_phan_xu_ly = '/qlnv/phan-xu-ly/get-don-vi-xu-ly';

  static String don_vi_da_ban_hanh(String id) =>
      '/van-ban-di/$id/don-vi-ban-hanh';

  static String thu_hoi_ban_hanh(String id) =>
      '/van-ban-di/$id/thu-hoi-da-ban-hanh';
  static const String duyet_van_ban_di = '/van-ban-di/duyet';

  static String nguoi_xu_ly_tiep_theo(String id) =>
      '/van-ban-di/$id/nguoi-xu-ly-tiep-theo';
  static const String get_all_don_vi_pxl_y_kien =
      '/qlnv/phan-xu-ly/get-all-don-vi';

  static String get_all_don_vi_pxl_nv(String id) =>
      '/qlnv/phan-xu-ly/get-all-don-vi?ProcessId=$id&';

  static String phan_xu_ly_y_kien(String id) => '/van-ban-di/$id/phan-xu-ly';
  static String chi_tiet_cong_viec = '/qlnv/cong-viec/chitiet/';
  static String cap_nhat_tinh_hinh_nhiem_vu =
      '/api/qlnv/tinh-hinh-thuc-hien/them-moi';
  static String post_THTHNV = '/qlnv/tinh-hinh-thuc-hien/them-moi';

  static String xoa_cong_viec(String id) =>
      '/qlnv/cong-viec/xoa?congViecId=$id';

  static String get_tree_da_phan_xu_ly(String id) =>
      '/ho-so-cong-viec/$id/get-tree-da-phan-xu-ly?';

  static String cap_nhat_vai_tro_tree(String id) =>
      '/ho-so-cong-viec/$id/cap-nhat-vai-tro-tree-phan-xu-ly';

  static String phan_xu_ly_ho_so_cong_viec(String id) =>
      '/ho-so-cong-viec/$id/phan-xu-ly';

  static String qlnv_van_ban_lien_quan(String id) =>
      '/qlnv/van-ban-lien-quan/$id';

  static String nhiem_vu_chi_tiet(String id) => '/qlnv/nhiem-vu/xoa?id=$id';

  static const String cap_nhat_trang_thai_nv =
      '/dm/trang-thai/tinh-hinh-thuc-hien';
  static const String cap_nhat_trang_thai_cv =
      '/qlnv/van-ban-lien-quan/cap-nhat-tinh-hinh-thuc-hien';

  static String huy_cong_viec(String id) =>
      '/qlnv/cong-viec/huy?congViecId=$id';

  static String get_kien_xu_ly(String id) => '/qlnv/y-kien-xu-ly/$id';

  static String tra_lai_nhiem_vu = '/qlnv/nhiem-vu/tra-lai-nhiem-vu';
  static String tra_lai_ho_so_cong_viec = '/ho-so-cong-viec/tra-lai';

  static String muc_do_cong_viec = '/qlnv/cong-viec/get-muc-do-cong-viec';
  static String nguoi_tra_lai_nhiem_vu = '/qlnv/nhiem-vu/nguoi-tra-lai';

  static String chi_tiet_nhiem_vu(String id, bool isPersonal) =>
      '/qlnv/nhiem-vu/get?nhiemVuId=$id&isCaNhan=$isPersonal';

  static String nvct_danh_sach_cong_viec(String id) =>
      '/qlnv/cong-viec/dsbynhiemvu?nhiemVuId=$id';
  static String qlnv_y_kien_xu_ly = '/qlnv/y-kien-xu-ly/update';

  static const String loai_van_ban = '/loai-van-ban/get-all-loai-van-ban';
  static const String don_vi_trong = '/don-vi-trong/get-opt-don-vi';
  static const String don_vi_ngoai = '/donvingoai/get-all';

  static String tra_lai_nhiem_vu_chinh_phu = '/qlnv/nhiem-vu/tra-lai-vpcp';

  static String duyet_ho_so_cong_viec(String _id) =>
      '/ho-so-cong-viec/$_id/duyet';

  static String ket_thuc_ho_so_cong_viec(String _id) =>
      '/ho-so-cong-viec/$_id/ket-thuc';

  static String mo_lai_ho_so_cong_viec(String _id) =>
      '/ho-so-cong-viec/$_id/mo-lai';

  static String luong_phan_xu_ly(String id) =>
      '/ho-so-cong-viec/$id/get-tree-da-phan-xu-ly';
  static String lich_su_cap_nhat_ho_so = '/lich-su-cap-nhat';
  static String lich_su_tra_lai_ho_so = '/lich-su-tra-lai';
  static String lich_su_phan_xu_ly_ho_so = 'lich-su-phan-xu-ly';
  static String get_list_ho_so_cong_viec = '/ho-so-cong-viec/search';
  static String chon_van_ban_di_hsvc = '/van-ban-di/get-multi-van-ban-di';

  static String nguoi_tra_lai_ho_so_cong_viec(String id) =>
      '/ho-so-cong-viec/$id/get-doi-tuong-duoc-tra-lai';

  static String chi_tiet_ho_so_cong_viec(String _id) => '/ho-so-cong-viec/$_id';
  static String chon_van_ban_den_hsvc = '/van-ban-di/danh-sach-van-ban-den';
  static String get_nhiem_vu_qua_han = '/qlnv/nhiem-vu/nhiem-vu-qua-han';
  static String get_nhiem_vu_theo_trang_thai =
      '/qlnv/nhiem-vu/dem-loai-nhiem-vu/donvi?';
  static String xoa_ho_so_song_viec = '/ho-so-cong-viec/';
  static String dem_loai_nhiem_vu = '/qlnv/nhiem-vu/count-loai-nhiem-vu';
  static String send_y_kien = 'http://10.0.0.49:8189/api/ho-so-cong-viec/y-kien';

  static String ho_so_cong_viec_count = '/ho-so-cong-viec/count';

  static String cho_y_kien_HSCV = '/ho-so-cong-viec/y-kien';
  static String danh_sach_cho_y_kien_HSCV(String id) =>
      '/ho-so-cong-viec/$id';
  static String ho_so_cong_viec_can_bo = '/can-bo/get-multi';
  static String thong_bao(int pageIndex, int pageSize) => '/qlvb/van-ban-den/thong-bao/get-all?pageIndex=$pageIndex&pageSize=$pageSize&appCode=ALL&';
  static String read_all = '/qlvb/van-ban-den/thong-bao/mark-as-read-all';
}
