using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace WebCayCanh.DAL.Models
{
    public partial class WEBCAYCANHContext : DbContext
    {
        public WEBCAYCANHContext()
        {
        }

        public WEBCAYCANHContext(DbContextOptions<WEBCAYCANHContext> options)
            : base(options)
        {
            // Nguyen Xuan Thuan
        }

        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<Manufacturer> Manufacturer { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<Orderdetail> Orderdetail { get; set; }
        
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
// To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=WebCayCanh;Persist Security Info=True;User ID=sa;Password=24091999;Pooling=False;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("CATEGORY");

                entity.Property(e => e.CategoryId)
                    .HasColumnName("CATEGORY_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.CategoryDescription).HasColumnName("CATEGORY_DESCRIPTION");

                entity.Property(e => e.CategoryImage)
                    .HasColumnName("CATEGORY_IMAGE")
                    .HasColumnType("image");

                entity.Property(e => e.CategoryName)
                    .HasColumnName("CATEGORY_NAME")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.ToTable("CUSTOMER");

                entity.Property(e => e.CustomerId)
                    .HasColumnName("CUSTOMER_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.City)
                    .HasColumnName("CITY")
                    .HasMaxLength(50);

                entity.Property(e => e.CustomerDescription).HasColumnName("CUSTOMER_DESCRIPTION");

                entity.Property(e => e.District)
                    .HasColumnName("DISTRICT")
                    .HasMaxLength(50);

                entity.Property(e => e.Email)
                    .HasColumnName("EMAIL")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .HasColumnName("FIRST_NAME")
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .HasColumnName("LAST_NAME")
                    .HasMaxLength(50);

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("PHONE_NUMBER")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Street)
                    .HasColumnName("STREET")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Manufacturer>(entity =>
            {
                entity.ToTable("MANUFACTURER");

                entity.Property(e => e.ManufacturerId)
                    .HasColumnName("MANUFACTURER_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.ManufacturerDescription).HasColumnName("MANUFACTURER_DESCRIPTION");

                entity.Property(e => e.ManufacturerName)
                    .HasColumnName("MANUFACTURER_NAME")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("ORDER");

                entity.Property(e => e.OrderId)
                    .HasColumnName("ORDER_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.CustomerId)
                    .HasColumnName("CUSTOMER_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OrderDate)
                    .HasColumnName("ORDER_DATE")
                    .HasColumnType("datetime");

                entity.Property(e => e.OrderDescription).HasColumnName("ORDER_DESCRIPTION");

                entity.Property(e => e.OrderNumber).HasColumnName("ORDER_NUMBER");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__ORDER__CUSTOMER___1ED998B2");
            });

            modelBuilder.Entity<Orderdetail>(entity =>
            {
                entity.ToTable("ORDERDETAIL");

                entity.Property(e => e.OrderdetailId)
                    .HasColumnName("ORDERDETAIL_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OrderId)
                    .HasColumnName("ORDER_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OrderdetailDescription).HasColumnName("ORDERDETAIL_DESCRIPTION");

                entity.Property(e => e.Price).HasColumnName("PRICE");

                entity.Property(e => e.ProductId)
                    .HasColumnName("PRODUCT_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.Quantity).HasColumnName("QUANTITY");

                entity.Property(e => e.Userid)
                    .HasColumnName("USERID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Orderdetail)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK__ORDERDETA__ORDER__1FCDBCEB");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Orderdetail)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK__ORDERDETA__PRODU__20C1E124");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Orderdetail)
                    .HasForeignKey(d => d.Userid)
                    .HasConstraintName("FK__ORDERDETA__USERI__21B6055D");
            });

           
            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("PRODUCT");

                entity.Property(e => e.ProductId)
                    .HasColumnName("PRODUCT_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.Amount).HasColumnName("AMOUNT");

                entity.Property(e => e.AmountRemaining).HasColumnName("AMOUNT_REMAINING");

                entity.Property(e => e.CategoryId)
                    .HasColumnName("CATEGORY_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

               

                entity.Property(e => e.ManufacturerId)
                    .HasColumnName("MANUFACTURER_ID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OldPrice).HasColumnName("OLD_PRICE");

                entity.Property(e => e.ProductDescription).HasColumnName("PRODUCT_DESCRIPTION");

                entity.Property(e => e.ProductImage)
                    .HasColumnName("PRODUCT_IMAGE")
                    .HasColumnType("image");

                entity.Property(e => e.ProductName)
                    .HasColumnName("PRODUCT_NAME")
                    .HasMaxLength(50);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK__PRODUCT__CATEGOR__1DE57479");

                entity.HasOne(d => d.Manufacturer)
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.ManufacturerId)
                    .HasConstraintName("FK__PRODUCT__MANUFAC__239E4DCF");
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.HasKey(e => e.Userid)
                    .HasName("PK__USERS__7B9E7F35C3330FD9");

                entity.ToTable("USERS");

                entity.Property(e => e.Userid)
                    .HasColumnName("USERID")
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.Email)
                    .HasColumnName("EMAIL")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .HasColumnName("FIRST_NAME")
                    .HasMaxLength(50);

                entity.Property(e => e.IsActive).HasColumnName("IS_ACTIVE");

                entity.Property(e => e.LastName)
                    .HasColumnName("LAST_NAME")
                    .HasMaxLength(50);

                entity.Property(e => e.Passwords)
                    .HasColumnName("PASSWORDS")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasColumnName("PHONE_NUMBER")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Username)
                    .HasColumnName("USERNAME")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsersDescription).HasColumnName("USERS_DESCRIPTION");

                entity.Property(e => e.UsersImage)
                    .HasColumnName("USERS_IMAGE")
                    .HasColumnType("image");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
