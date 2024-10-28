using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace organic_food_store.Models;

public partial class OrganicFoodStoreContext : DbContext
{
    public OrganicFoodStoreContext()
    {
    }

    public OrganicFoodStoreContext(DbContextOptions<OrganicFoodStoreContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }

    public virtual DbSet<ChuyenMuc> ChuyenMucs { get; set; }

    public virtual DbSet<DonHang> DonHangs { get; set; }

    public virtual DbSet<KhachHang> KhachHangs { get; set; }

    public virtual DbSet<LoaiSp> LoaiSps { get; set; }

    public virtual DbSet<NguoiDung> NguoiDungs { get; set; }

    public virtual DbSet<Sp> Sps { get; set; }

    public virtual DbSet<TinTuc> TinTucs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=ConnectionStrings:OrganicFoodStore");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ChiTietDonHang>(entity =>
        {
            entity.HasKey(e => new { e.MaDh, e.MaSp });

            entity.ToTable("ChiTietDonHang");

            entity.Property(e => e.MaDh).HasColumnName("MaDH");
            entity.Property(e => e.MaSp).HasColumnName("MaSP");
            entity.Property(e => e.DonGia).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.MaDhNavigation).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.MaDh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietDonHang_DonHang");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietDonHang_SP");
        });

        modelBuilder.Entity<ChuyenMuc>(entity =>
        {
            entity.HasKey(e => e.Ma);

            entity.ToTable("ChuyenMuc");

            entity.Property(e => e.MaCt).HasColumnName("MaCT");
            entity.Property(e => e.Mota).HasColumnType("ntext");
            entity.Property(e => e.Ten).HasMaxLength(500);
        });

        modelBuilder.Entity<DonHang>(entity =>
        {
            entity.HasKey(e => e.Ma);

            entity.ToTable("DonHang");

            entity.Property(e => e.DiaChi).HasMaxLength(500);
            entity.Property(e => e.DienThoai)
                .HasMaxLength(16)
                .IsUnicode(false);
            entity.Property(e => e.Email).HasMaxLength(500);
            entity.Property(e => e.MaKh).HasColumnName("MaKH");
            entity.Property(e => e.PhiGiao).HasColumnType("decimal(10, 0)");
            entity.Property(e => e.PhuongThucTt)
                .HasMaxLength(500)
                .HasColumnName("PhuongThucTT");
            entity.Property(e => e.TenNguoiNhan).HasMaxLength(500);

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.DonHangs)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK_DonHang_KhachHang");
        });

        modelBuilder.Entity<KhachHang>(entity =>
        {
            entity.HasKey(e => e.Ma);

            entity.ToTable("KhachHang");

            entity.Property(e => e.DiaChi).HasMaxLength(500);
            entity.Property(e => e.DienThoai)
                .HasMaxLength(16)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Password).HasMaxLength(500);
            entity.Property(e => e.Ten).HasMaxLength(500);
        });

        modelBuilder.Entity<LoaiSp>(entity =>
        {
            entity.HasKey(e => e.Ma);

            entity.ToTable("LoaiSP");

            entity.Property(e => e.Mota).HasColumnType("ntext");
            entity.Property(e => e.Ten).HasMaxLength(500);
        });

        modelBuilder.Entity<NguoiDung>(entity =>
        {
            entity.HasKey(e => e.Ma);

            entity.ToTable("NguoiDung");

            entity.Property(e => e.Anh).HasMaxLength(500);
            entity.Property(e => e.DiaChi).HasMaxLength(500);
            entity.Property(e => e.DienThoai)
                .HasMaxLength(16)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Email).HasMaxLength(500);
            entity.Property(e => e.MatKhau).HasMaxLength(500);
            entity.Property(e => e.Quyen).HasMaxLength(500);
            entity.Property(e => e.Ten).HasMaxLength(500);
            entity.Property(e => e.TenDangNhap).HasMaxLength(50);
        });

        modelBuilder.Entity<Sp>(entity =>
        {
            entity.HasKey(e => e.Ma);

            entity.ToTable("SP");

            entity.Property(e => e.Anh1).HasMaxLength(500);
            entity.Property(e => e.Anh2).HasMaxLength(500);
            entity.Property(e => e.Anh3).HasMaxLength(500);
            entity.Property(e => e.AnhNho).HasMaxLength(500);
            entity.Property(e => e.Dvt)
                .HasMaxLength(50)
                .HasColumnName("DVT");
            entity.Property(e => e.Gia).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.Hang).HasMaxLength(500);
            entity.Property(e => e.MoTa).HasColumnType("ntext");
            entity.Property(e => e.Ten).HasMaxLength(500);
            entity.Property(e => e.Tskt)
                .HasColumnType("ntext")
                .HasColumnName("TSKT");

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.Sps)
                .HasForeignKey(d => d.MaLoai)
                .HasConstraintName("FK_SP_LoaiSP");
        });

        modelBuilder.Entity<TinTuc>(entity =>
        {
            entity.HasKey(e => e.Ma);

            entity.ToTable("TinTuc");

            entity.Property(e => e.Anh).HasMaxLength(500);
            entity.Property(e => e.LoaiTin).HasMaxLength(500);
            entity.Property(e => e.MaCm).HasColumnName("MaCM");
            entity.Property(e => e.Mota).HasColumnType("ntext");
            entity.Property(e => e.MotaNgan).HasMaxLength(500);
            entity.Property(e => e.NguoiDang).HasMaxLength(500);
            entity.Property(e => e.TieuDe).HasMaxLength(500);

            entity.HasOne(d => d.MaCmNavigation).WithMany(p => p.TinTucs)
                .HasForeignKey(d => d.MaCm)
                .HasConstraintName("FK_TinTuc_ChuyenMuc");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
