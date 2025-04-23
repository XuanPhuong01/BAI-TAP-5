# baitap5
## baitap5_ Nguyễn Thị Xuân Phương_K225480106054_HQTCSDL

## BÀI TẬP VỀ NHÀ 05, Môn Hệ quản trị csdl.

**SUBJECT: Trigger on mssql**

**A. Trình bày lại đầu bài của đồ án PT&TKHT:**
1. Mô tả bài toán của đồ án PT&TKHT, 
   đưa ra yêu cầu của bài toán đó
2. Cơ sở dữ liệu của Đồ án PT&TKHT :
   Có database với các bảng dữ liệu cần thiết (3nf),
   Các bảng này đã có PK, FK, CK cần thiết
 
**B. Nội dung Bài tập 05:**
1. Dựa trên cơ sở là csdl của Đồ án
2. Tìm cách bổ xung thêm 1 (hoặc vài) trường phi chuẩn
   (là trường tính toán đc, nhưng thêm vào thì ok hơn,
    ok hơn theo 1 logic nào đó, vd ok hơn về speed)
   => Nêu rõ logic này!
3. Viết trigger cho 1 bảng nào đó, 
   mà có sử dụng trường phi chuẩn này,
   nhằm đạt được 1 vài mục tiêu nào đó.
   => Nêu rõ các mục tiêu 
4. Nhập dữ liệu có kiểm soát, 
   nhằm để test sự hiệu quả của việc trigger auto run.
5. Kết luận về Trigger đã giúp gì cho đồ án của em.

-------------------------------------------------------------------------------------------------------------------

## A. Trình bày lại đầu bài của đồ án PT&TKHT:
1. Yêu cầu đồ án: Phân tích thiết kế hệ thống hỗ trợ tân sinh viên chọn nghành học tại trường ĐHKTCN
2. Dựa trên yêu cầu của hệ thống hỗ trợ tân sinh viên chọn nghành học tại trường ĐHKTCN, em có các bảng dữ liệu cần thiết(3NF) như sau:
- Bảng CauHoi:
  
  ![image](https://github.com/user-attachments/assets/c271bd68-2e33-4f77-86c1-788c5acbc9c3)
- Bảng GoiYNganh:

  ![image](https://github.com/user-attachments/assets/9714f574-e472-48e2-8407-7b5a971c1a81)
- Bảng Nganh:

  ![image](https://github.com/user-attachments/assets/c7b0a2a7-dbff-4466-9a83-6a26e2f2fe5b)
- Bảng SinhVien:

  ![image](https://github.com/user-attachments/assets/8e378308-2468-4617-b3a5-ec04299b5ae6)
- Bang TraLoi:

  ![image](https://github.com/user-attachments/assets/84ca6ff4-b2eb-49ba-9237-c0e4fae720e6)
  Với các khóa ngoại liên kết cho bảng:
  
  ![image](https://github.com/user-attachments/assets/5b242949-4931-4968-ade4-762007fa07bb)

  ![image](https://github.com/user-attachments/assets/b1977350-7c3b-4439-8251-594cf5e1a8a3)

  ![image](https://github.com/user-attachments/assets/c70f3c20-dad6-452c-b1bb-18e4f1775cc0)

  ![image](https://github.com/user-attachments/assets/5d1288d5-f1d7-46ed-bda1-dba45c3cf3b6)

  ![image](https://github.com/user-attachments/assets/0b913118-6d22-4406-b9fb-be6599d682ab)

- Bảng liên kết chọn ngành:

  ![image](https://github.com/user-attachments/assets/fe8ce10f-49ba-450e-b616-09600fb9b59f)



 ## B.Nội dung Bài tập 05:
 1. Tạo csdl cho hệ thống chọn ngành 

 2.Bố sung thêm trường phi chuẩn: số lượng sân còn trống trước và sau khi được tạo, số lượng người tham gia trong bảng trận đấu, số trận đã chơi và số trận đã tạo trong bảng thông tin người chơi

 3. Viết trigger cho các bảng để đạt được mục tiêu:
- Bấm dấu "+" vào bảng và chuột phải vào Triggers ---> new trigger

  ![image](https://github.com/user-attachments/assets/32461c3a-c4c4-4bfd-a09f-6388d57a45ec)
  
- Tự động cập nhật cột SoNganhPhuHop trong bảng SinhVien mỗi khi có thêm, sửa, hoặc xóa dữ liệu ở bảng GoiYNganh.

  ![image](https://github.com/user-attachments/assets/c724f846-f81a-4d01-ad6a-5388cc220820)

 4.Test:

  ![image](https://github.com/user-attachments/assets/d8f0893f-3c22-43f3-af48-19cd40a16b25)
  
  5. Kết luận về Trigger đã giúp gì cho đồ án của em.

- Tự động duy trì số liệu luôn luôn đúng — không phải nhớ “chạy lệnh UPDATE” tay mỗi lần thay đổi.
- Tránh sai sót khi người dùng hoặc ứng dụng quên cập nhật trường phi chuẩn.
- Đảm bảo tính nhất quán của dữ liệu ngay trên CSDL, không phụ thuộc vào code bên ngoài.
  


  

 

  


  




  

  

  
  
