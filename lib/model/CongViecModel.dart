
import 'dart:convert';

CongViec congViecFromJson(String str) => CongViec.fromJson(json.decode(str));

String congViecToJson(CongViec data) => json.encode(data.toJson());

class CongViec {
  int maCv;
  String tieuDe;
  String noiDung;
  DateTime gioBatDau;
  DateTime gioKetThuc;
  DateTime ngayBatDau;
  DateTime ngayKetThuc;
  String trangThai;
  int tienDo;
  String ghiChu;
  int maNguoiLam;
  int maNguoiGiao;
  int kieu;
  String hoTen;

  CongViec({
    required this.maCv,
    required this.tieuDe,
    required this.noiDung,
    required this.gioBatDau,
    required this.gioKetThuc,
    required this.ngayBatDau,
    required this.ngayKetThuc,
    required this.trangThai,
    required this.tienDo,
    required this.ghiChu,
    required this.maNguoiLam,
    required this.maNguoiGiao,
    required this.kieu,
    required this.hoTen,
  });

  factory CongViec.fromJson(Map<String, dynamic> json) => CongViec(
    maCv: json["MaCV"],
    tieuDe: json["TieuDe"],
    noiDung: json["NoiDung"],
    gioBatDau: DateTime.parse(json["GioBatDau"]),
    gioKetThuc: DateTime.parse(json["GioKetThuc"]),
    ngayBatDau: DateTime.parse(json["NgayBatDau"]),
    ngayKetThuc: DateTime.parse(json["NgayKetThuc"]),
    trangThai: json["TrangThai"],
    tienDo: json["TienDo"],
    ghiChu: json["GhiChu"].toString(),
    maNguoiLam: json["MaNguoiLam"],
    maNguoiGiao: json["MaNguoiGiao"],
    kieu: json["Kieu"],
    hoTen: json["HoTen"],
  );

  Map<String, dynamic> toJson() => {
    "MaCV": maCv,
    "TieuDe": tieuDe,
    "NoiDung": noiDung,
    "GioBatDau": gioBatDau.toIso8601String(),
    "GioKetThuc": gioKetThuc.toIso8601String(),
    "NgayBatDau": ngayBatDau.toIso8601String(),
    "NgayKetThuc": ngayKetThuc.toIso8601String(),
    "TrangThai": trangThai,
    "TienDo": tienDo,
    "GhiChu": ghiChu,
    "MaNguoiLam": maNguoiLam,
    "MaNguoiGiao": maNguoiGiao,
    "Kieu": kieu,
    "HoTen": hoTen,
  };
}
