import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/settings_pages/settings.dart';

import '../../core/constants.dart';
import '../Saved_Items/saved.dart';
import '../home_pages/home.dart';
class UsageConditions extends StatefulWidget {
  const UsageConditions({Key? key}) : super(key: key);

  @override
  State<UsageConditions> createState() => _UsageConditionsState();
}

class _UsageConditionsState extends State<UsageConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text ("شروط الاستخدام",style: TextStyle(fontSize:22),),
        actions: [Padding(
          padding: const EdgeInsets.only(left: 15.0),
            child: IconButton(icon: const Icon(CupertinoIcons.arrow_left), onPressed: () { Navigator.pop(context); },)
        )],
         leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          width: 90,
          color: Constants.darkBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Settings(),
                      ),
                    );
                  },
                  child: Image.asset("images/Settings.png")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Saved(),
                      ),
                    );
                  },
                  child: Image.asset("images/Bookmark.png")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Home(),
                      ),
                    );
                  },
                  child: Image.asset("images/Home.png")),
            ],
          ),
        ),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               SizedBox(height: 34,),
              Padding(
                padding: EdgeInsets.only(right:22,left: 23),
                child: Column(
                  children: [
                    Text("مرحبًا بك في تطبيق حاور. يرجى قراءة الشروط التالية بعناية قبل استخدام التطبيق، حيث يتم توضيح الشروط المتعلقة بفتح الكاميرا والوصول إلى مساحة تخزين الهاتف."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(" موافقة المستخدم."
                        ,style: TextStyle(fontSize: 16),softWrap: true,textAlign: TextAlign.start,),
                    ),
                    Text(" باستخدامك لتطبيق حاور ، فإنك توافق على شروط هذا الاتفاق وتؤكد موافقتك على فتح الكاميرا والوصول إلى مساحة تخزين الهاتف."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("فتح الكاميرا"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("تتيح لك تطبيق حاور استخدام الكاميرا لأغراض مثل تسجيل الفيديو المراد استخدامه للتواصل"
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("الوصول إلى مساحة التخزين"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                Text("يتطلب التطبيق الوصول إلى مساحة التخزين على هاتفك لحفظ و رفع الفيديوهات المراد استخدامها"
                  ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("حقوق الملكية"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("أنت تحتفظ بحقوق الملكية الفكرية للمحتوى الذي تقوم بتحميله أو مشاركته عبر التطبيق. بتقديم المحتوى، فإنك تمنح حاور ترخيصًا عالميًا، غير حصري، لا قابل للإلغاء لاستخدام ونسخ وتوزيع وتعديل وتحميل المحتوى."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("خصوصية البيانات"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("نحن نحترم خصوصية مستخدمينا ونتعهد بعدم مشاركة أو بيع بيانات المستخدمين. يُرجى قراءة سياسة الخصوصية لفهم كيفية جمع واستخدام البيانات."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("الأمان"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("نحن نتخذ تدابير أمان قوية لحماية البيانات الخاصة بك، ونشفير الاتصالات لضمان سرية المعلومات."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("الامتثال للتشريعات"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("يتم الامتثال لجميع القوانين واللوائح المحلية المتعلقة بحقوق الخصوصية وحماية البيانات."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("التحديثات والتغييرات"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("تحتفظ حاور بحق تحديث هذه الشروط بشكل دوري. يُفضل مراجعة الشروط بانتظام للتحقق من التغييرات."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("الدعم والتواصل"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("نحن هنا لدعمك. لأي استفسارات أو مشكلات، يُرجى الاتصال بنا عبر"
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("7awer.support@gmail.com"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),
                    Text("استخدامك لتطبيق حاور، فإنك توافق على هذه الشروط. إذا كنت غير موافق عليها، يُرجى عدم استخدام التطبيق."
                      ,style: TextStyle(fontSize: 16),softWrap: true,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("شكرًا لاستخدامك تطبيق حاور."
                    ,style: TextStyle(fontSize: 16),softWrap: true,),
                ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("آخر تحديث: يناير 2024"
                        ,style: TextStyle(fontSize: 16),softWrap: true,),
                    ),








                  ],
                ),
              ),

            ],),
        ),
      ),

    );
  }
}
