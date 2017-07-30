## Face - Detect
找每個人臉的 特徵

年紀 / 性別 / 毛髮 / 化妝

return faceId / it will expire after 24hours

## Face - Find Similar
如果用detect 搜尋過人臉之後會被存起來，再用 detect 拿到當下照片的faceId 再去faceList 建立名單或是 faceIds array 中查找相似

## Face - Group
暫存faceId 的group會回傳的group會是個array，如果其中的人臉是相同的人會被分在同組，and return  messyGroup

## Face - Identify
從person group辨識不認識的人臉，會給出信心指數排名
person group應該要被訓練成可以被辨識的
1. 可以一次至多10張臉辨識一個group
2. Face - Find Similar 可以從facelist來辨識  similar 臉，取代person group

## Face - Verify
便是兩張照片是否同一個人

## Face List - Add a Face to a Face List  post
被塞進去的臉都會具有一個 targetFace rectangle,新增一個臉進去 faceList 被塞進list裡面的臉都會具有一個presistedDaceId
1. 要刪除就用Delete
2. JPEG, PNG GIF BMP 照片須大魚1kb 小於4MB
3. 可以偵測的face size 36*36 ~4096*4096 
4. 如果多張臉或是被東西擋住也會被視為error
5. 被指定的方筐如果不是從face detect來的話不保證資料正確性

Facelist 裡面的資料都不會過期，可以用Find Similar 查找相似臉。
常用於查找慶祝會，朋友群，家庭群組
face group have a maximum of 1000 faces

## Face List - Create a Face List put
可以創建空的list 附帶名字和userData

## Person - Add a Person Face post
加入一個這個人的辨識圖．這個臉會有個 targetFace rectangle, 這個會return 一個persistedFaceId代表這張臉。
也可以是用face  - detect 偵測臉

1. 每個人可以有248張照片
2. JPEG, PNG GIF BMP 照片須大魚1kb 小於4MB
3. 可以偵測的face size 36*36 ~4096*4096 
4. 如果多張臉或是被東西擋住也會被視為error

## Person - Create a Person post
可以用name userData
person會被create 在一個person group裡面
如果有照片沒有主人 就可以create一個person拿來放照片
免費的等級每個group只能有1000個人，付費的話可以有10000或更多的人數

## Person Group - Create a Person Group put
可以 create 一個 person group
這個可以被 Face - Identify 用來查詢臉

## Person Group - Get Person Group Training Status get
status : person group需要被訓練成successed才可以被 Face - Identify 拿來查找

## Person Group - Train Person Group post
指定 group 進序列開始等待訓練，並不會馬上開始訓練
訓練完才能開始被 Face - Identify 使用，可以用上面這隻一直去get status 詢問好了沒


<table>
  <thead>
  <tr>
    <th>TIER</th>
    <th>FEATURES</th>
    <th>PRICE</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>Face API – Free</td>
    <td>Up to 20 transactions per minute</td>
    <td>30,000 transactions free per month</td>
  </tr>
  <tr>
    <td>Face API – Standard</td>
    <td>Up to 10 transactions per second</td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>0 - 1,000,000 transactions</td>
    <td>NT$46.55 per 1,000 transactions</td>
  </tr>
  <tr>
    <td></td>
    <td>1,000,001 - 5,000,000 transactions</td>
    <td>NT$34.14 per 1,000 transactions</td>
  </tr>
  <tr>
    <td></td>
    <td>5,000,001 - 20,000,000 transactions</td>
    <td>NT$20.17 per 1,000 transactions</td>
  </tr>
  <tr>
    <td>Face Storage</td>
    <td>Face storage - images size up to 4 MB each</td>
    <td>NT$15.52 per 1,000 images per month</td>
  </tr>
  </tbody>
</table>


						
	
					
			
			
					
