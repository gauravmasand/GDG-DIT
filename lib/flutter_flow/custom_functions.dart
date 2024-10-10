import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> getMembersData() {
  return [
    {
      "Timestamp": "10/10/2024 20:00:12",
      "email": "masandgaurav231@gmail.com",
      "Name": "Gaurav Masand",
      "Year": "TE",
      "Department": "AIDS",
      "Roll No.": 74,
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1Vz29U3zRXqoYXPL4Knx5XW8ciorU8guF",
      "formal_bio":
          "Full Stack Developer | Intermediate DSA | Experience of Working with 3 Companies | Skills: Flutter, Node.js, Express, ML, Data Science, and Data Analytics.",
      "linkedin": "https://linkedin.com/in/gaurav-masand",
      "github": "https://github.com/gauravmasand",
      "instagram": "instagram.com/just_gaurav",
      "cp_profile": "https://leetcode.com/u/masandgaurav231/",
      "Role": "Flutter",
      "Select": "Lead"
    },
    {
      "Timestamp": "10/9/2024 2:26:04",
      "email": "onkarwattamwar45@gmail.com",
      "Name": "Onkar Vinodrao Wattamwar ",
      "Year": "BE",
      "Department": "AI&DS",
      "Roll No.": 31,
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1DDhDAwF7kP9xHTXtl2i6SmsjihcINtbL",
      "formal_bio":
          "I have a deep passion for problem-solving and have successfully tackled over 400 Data Structures and Algorithms problems on Leetcode, achieving a contest rating of 1686. ",
      "linkedin": "https://www.linkedin.com/in/onkar-wattamwar-455331228/",
      "github": "https://github.com/onkarwatt",
      "instagram": "https://www.instagram.com/watt.cpp/",
      "cp_profile": "https://leetcode.com/u/onkarwatt001/",
      "Role": "Co-Lead"
    },
    {
      "Timestamp": "10/9/2024 2:39:46",
      "email": "riteshphadtare32@gmail.com",
      "Name": "Ritesh Ranjeet Phadtare",
      "Year": "BE",
      "Department": "Information Technology",
      "Roll No.": 42,
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1_Qe7rqMKsIhh0-RTBeNho9bsZ2PuHs3d",
      "formal_bio":
          "My name is Ritesh Ranjeet Phadtare, and I’m a final-year student of Information Technology at Dr. D. Y. Patil Institute of Technology. I’ve always been passionate about coding and tech. I’ve worked on various projects, including full-stack development, Android app development, and web applications, using technologies like Django, Node.js, and React. Right now, I’m focused on preparing for campus placements and excited to start my career in the tech industry soon!",
      "linkedin": "https://www.linkedin.com/in/ritesh-phadtare-597911203/",
      "github": "https://github.com/RiteshPhadtare2004",
      "instagram": "https://www.instagram.com/_.riteshhh._/",
      "cp_profile":
          "https://leetcode.com/u/riteshphadtare32/ , https://www.geeksforgeeks.org/user/riteshphadtare1202/",
      "Role": "HOO (Tech)"
    },
    {
      "Timestamp": "10/9/2024 3:12:34",
      "email": "suhelalipakjade@gmail.com",
      "Name": "Suhelali Shakil Pakjade ",
      "Year": "BE",
      "Department": "Artificial intelligence and data science ",
      "Roll No.": "BEAI&DSC54",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1n1wB0AnlTlr6FwChz6vtFJas52O1VpXv",
      "formal_bio":
          "I'm a tech enthusiast who loves learning, problem-solving, and finding smart solutions. Easygoing and friendly, I enjoy connecting with others and exploring new ideas.",
      "linkedin": "https://www.linkedin.com/in/suhelali-pakjade-0842b9226/",
      "github": "Github.com/suhelali14",
      "instagram": "https://www.instagram.com/suhelali.14",
      "cp_profile": "https://leetcode.com/u/suhel_ali_15121472/",
      "Role": "Web Development",
      "Select": "Co-Lead"
    },
    {
      "Timestamp": "10/9/2024 5:28:20",
      "email": "mrunalithakare073@gmail.com",
      "Name": "Mrunali Thakare",
      "Year": "SE",
      "Department": "Computer Engineering ",
      "Roll No.": "SCOA69",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=154EF49ecnljmbRoWFXgT-QdBEIUkOEpf",
      "formal_bio": "Mission statement and values",
      "linkedin": "https://www.linkedin.com/in/mrunal-thakare-690063254/",
      "github": "https://github.com/Mrunalthakare57",
      "instagram": "Na",
      "Twitter (X) URL": "Na",
      "cp_profile": "Na",
      "Role": "Web Development",
      "Select": "Member Lead"
    },
    {
      "Timestamp": "10/9/2024 6:50:22",
      "email": "husaindudhiya2108@gmail.com",
      "Name": "Husain Dudhiya ",
      "Year": "SE",
      "Department": "AI&DS",
      "Roll No.": "SAI&DC13",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1q6qXSiwDzSEx5-glod9QXh61dPjK3JPG",
      "formal_bio":
          "HUSAIN DUDHIYA \nPosition: Event Management \nGoogle Developer Groups (GDG)\n\nI am a member of the Google Developer Groups , studying Bachelor's of engineering in Artificial intelligence and data science at Dr. D.Y. Patil Institute of technology. Passionate about organizing engaging tech events , I am dedicated towards fostering a collaboration and Innovation within Tech community ",
      "linkedin":
          "https://www.linkedin.com/in/husain-dudhiya-a991a8290?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
      "github": "https://github.com/coderlucifer",
      "instagram":
          "https://www.instagram.com/husain._xx._?igsh=MTk3OHN1c3c3NDNqNQ==",
      "Twitter (X) URL":
          "https://x.com/HusainDudhiya?t=GJrXhQckzrz-Y-51ZViYlg&s=09",
      "Role": "Event Management"
    },
    {
      "Timestamp": "10/9/2024 7:24:07",
      "email": "prajwalrode31@gmail.com",
      "Name": "Prajwal Rode ",
      "Year": "BE",
      "Department": "Computer Engineering ",
      "Roll No.": "BCOD33",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1LhgKcM2xlfnjh42k2gWRBXd9sFxUfmDN",
      "formal_bio":
          "Web Developer with strong foundation in solving Data structures and algorithms (DSA) questions.",
      "linkedin":
          "https://www.linkedin.com/in/prajwal-rode-a8858b229?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
      "github": "https://github.com/prajwal3641",
      "instagram":
          "https://www.instagram.com/prajwal_rode_/profilecard/?igsh=aHlsZmNkeDh1Ymtq",
      "cp_profile": "spyyder_05",
      "Role": "Co-Lead"
    },
    {
      "Timestamp": "10/9/2024 8:15:37",
      "email": "zamnanideepak@gmail.com",
      "Name": "Deepak Anil Zamnani",
      "Year": "SE",
      "Department": "Computer Engineering",
      "Roll No.": "SCOC58",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1r2zTELUPmKijBd9QrcXp1s9mPZJvwrVC",
      "formal_bio":
          "Motivated second-year college student pursuing a degree in Computer Engineering with hands-on experience in software development and mobile application design along with database management with Firebase.Proficient in C, C++, Java, Python, and Flutter, seeking opportunities to apply my skills and contribute to impactful projects.Currently putting my hands on DataScience and Machine learning.",
      "linkedin": "https://www.linkedin.com/in/deepak-zamnani-9958972a2/",
      "github": "https://github.com/DeepakZamnani",
      "instagram": "https://www.instagram.com/deefackk/",
      "Twitter (X) URL": "https://x.com/DeepakZamnani",
      "Role": "Flutter",
      "Select": "Co-Lead"
    },
    {
      "Timestamp": "10/9/2024 8:48:09",
      "email": "milichothani4@gmail.com",
      "Name": "Mili Chothani",
      "Year": "SE",
      "Department": "AI & DS",
      "Roll No.": "SAI&DSA24",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1jQAHExJIlYw-8dOIK3xvcDNvgjhjh8C6",
      "formal_bio":
          "Mili Chothani\nSecond-Year Undergraduate student\nCurrently pursuing Engineering in AI&DS\nPassionate about leveraging technology to solve complex problems. I am actively engaged in academic projects and collaborative research inititives. Other than studies, I enjoy participating in tech workshops and hackathons, continuosly seeking opportunities to expand my skills and knowlwdge in this rapidly developing domain.",
      "linkedin": "https://www.linkedin.com/in/mili-chothani-776656280/",
      "github": "https://github.com/milichothani",
      "instagram": "https://www.instagram.com/milichothani/",
      "Twitter (X) URL": "-",
      "Role": "Editor"
    },
    {
      "Timestamp": "10/9/2024 9:51:12",
      "email": "tulsiborse21@gmail.com",
      "Name": "Tulsi Borse ",
      "Year": "TE",
      "Department": "Computer Engineering ",
      "Roll No.": "TCOD02",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1nlftmHGlJYYFU7tbl-pEgS7wdBuoeKE-",
      "formal_bio":
          "I am part of the GDSC marketing team, leveraging leadership and event promotion skills to drive engagement. With interests in web development and cloud computing, I combine analytical thinking with creativity to make a positive impact while continuously growing and collaborating.",
      "linkedin": "www.linkedin.com/in/tulsi-borse",
      "github": "https://github.com/Triborse",
      "instagram":
          "https://www.instagram.com/tulsii.borse?igsh=MmUwaXJtNmd3a293",
      "Role": "Marketing"
    },
    {
      "Timestamp": "10/9/2024 10:01:27",
      "email": "prathameshbshinde2004@gmail.com",
      "Name": "Prathamesh Shinde ",
      "Year": "TE",
      "Department": "Artificial Intelligence and Data Science ",
      "Roll No.": "TAI&DS-C26",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1TqCl9rH-mjDGvXdYl_XFLF44PB0-qJtD",
      "formal_bio":
          "Cyber Security Enthusiast | OSINT | Web Application Security | Intern at Cybersapiens | Python ",
      "linkedin":
          "https://www.linkedin.com/in/prathamesh-shinde-cybersecurity-recono7",
      "github": "https://github.com/PrathamShinde0020",
      "instagram":
          "https://www.instagram.com/prathamesh_shinde_0020/profilecard/?igsh=Y2VyZTI1dmtiaTZr",
      "Role": "Cyber Security",
      "Select": "Lead"
    },
    {
      "Timestamp": "10/9/2024 11:07:00",
      "email": "sujalbagade123@gmail.com",
      "Name": "Sujal Bagade",
      "Year": "BE",
      "Department": "Computer Engineering",
      "Roll No.": "BCOB17",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1YgOA2z3lCsEi02-1p9DBG97p7bs-wx10",
      "formal_bio":
          "Enthusiastic final year Computer Engineering student with a passion for innovative technologies and problemsolving. Proven aptitude in programming, algorithms, and software development, evident through successful projects and coursework. Strong analytical skills and a keen desire to learn and adapt to emerging trends in the field. Seeking opportunities to apply my knowledge in a collaborative and dynamic environment to contribute to cutting-edge advancements in technology",
      "linkedin": "www.linkedin.com/in/sujalbagade",
      "github": "https://github.com/SujalBagade",
      "instagram": "https://www.instagram.com/_sujal_bagade",
      "Twitter (X) URL": "https://x.com/SujalBagade24",
      "Role": "Blockchain Technology",
      "Select": "Lead"
    },
    {
      "Timestamp": "10/9/2024 12:13:53",
      "email": "21511810.dypit@dypvp.edu.in",
      "Name": "Dipanshu Wanjari",
      "Year": "BE",
      "Department": "Computer ",
      "Roll No.": "BCOB22",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1wVqNKq_jgZJCpAYI1xq-aIEj8lsGSHto",
      "formal_bio":
          "Hey! I'm Dipanshu Wanjari, a Final Year Computer Engineering student and the UI/UX Lead for the Google Developer Group. I focus on designing user-friendly digital experiences. I'm passionate about using technology and design to solve real-world problems.",
      "linkedin": "www.linkedin.com/in/dipanshu-wanjari-977439228",
      "github": "https://github.com/Dipanshu0Wanjari",
      "instagram": "https://www.instagram.com/_dipanshu27_/",
      "Role": "UI/UX",
      "Select": "Lead"
    },
    {
      "Timestamp": "10/9/2024 12:17:14",
      "email": "vaishnavikshirsagar1607@gmail.com",
      "Name": "Vaishnavi Anil Kshirsagar ",
      "Year": "BE",
      "Department": "Computer engineering",
      "Roll No.": "BCOD22",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1r7vbQC8-pK7LMSvsvAv3YgifRvxagD3d",
      "formal_bio": "Full stack developer ",
      "linkedin": "https://www.linkedin.com/in/vaishnavi-kshirsagar-636461228/",
      "github": "https://github.com/vaishuKshirsagar",
      "instagram": "https://www.instagram.com/itsvaishnavi_16/",
      "Twitter (X) URL": "https://x.com/VaishnaviKshi18",
      "Role": "Web Development",
      "Select": "Member Lead"
    },
    {
      "Timestamp": "10/9/2024 13:01:00",
      "email": "sakshiade5176@gmail.com",
      "Name": "Sakshi Dilip Ade ",
      "Year": "TE",
      "Department": "Civil branch ",
      "Roll No.": "TCLA 45 ",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1X5x9jBcRb4Ik1Dq_SdO4Ygh200jwVGwh",
      "formal_bio":
          "Sakshi Ade, pursuing graduation in BE Civil engineering from Dr.D.Y.Patil Institute of Technology.",
      "linkedin": "Not created",
      "github": "Not created ",
      "instagram":
          "https://www.instagram.com/_sakshi_1453_?igsh=NXBjYnU5Z2plbmY=",
      "Twitter (X) URL": "Not created ",
      "cp_profile": "Not created ",
      "Role": "Event Management"
    },
    {
      "Timestamp": "10/9/2024 13:35:29",
      "email": "adityachaudhari29@gmail.com",
      "Name": "Aditya Chaudhari",
      "Year": "SE",
      "Department": "Computer Engineering",
      "Roll No.": "SCOA54",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1KBG9hu6CMvto2bR5ijM9gO0gxjLsxMAP",
      "formal_bio":
          "Currently Pursuing Bachelor's Degree in Computer Engineering at Dr.D.Y.Patil Institute of Technology, Pimpri, Pune. I am International General Knowledge Olympiad GOLD MEDALIST. I am Aspiring Cloud Engineer passionate to learn about Cloud Technologies. I have good General Knowledge about Current Affairs and Current Indian Politics. Good in Sports like Cricket, Kabaddi, Table Tennis",
      "linkedin": "www.linkedin.com/in/aditya-chaudhari-347845171",
      "github": "https://github.com/aditya290705",
      "instagram":
          "https://www.instagram.com/adityaaac_29?igsh=NTE0MGh2bGVsbzQz",
      "Role": "Event Management"
    },
    {
      "Timestamp": "10/9/2024 14:06:26",
      "email": "aditi191016@gmail.com",
      "Name": "Aditi Konde ",
      "Year": "SE",
      "Department": "Artificial Intelligence and Data Science ",
      "Roll No.": "SA AI&DS05",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1bD5nQJfLt2yQ626J0-DeqidGn7u_tIv1",
      "formal_bio":
          "Aditi Konde\nEditor, Google Developer Groups\n\nI am second-year undergraduate student pursuing a Bachelor of Engineering in Artificial Intelligence and Data Science. As an editor for the Google Developer Group, I am passionate about fostering collaboration within the developer community and creating engaging content that enhance my designing skills.",
      "linkedin":
          "https://www.linkedin.com/in/aditi-k-5b0a8b283?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
      "github":
          "https://www.linkedin.com/in/aditi-k-5b0a8b283?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
      "Role": "Editor"
    },
    {
      "Timestamp": "10/9/2024 14:27:30",
      "email": "adityarekhe1030@gmail.com",
      "Name": "Aditya Rekhe ",
      "Year": "BE",
      "Department": "Computer Engineering ",
      "Roll No.": "BC0A52",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1luI6HJ-CBvNR7c5onC__SU5Z-ufTCpwD",
      "formal_bio":
          "Passionate about decentralized technologies and their potential to reshape industries. With extensive experience in blockchain development, I have participated in multiple hackathons, driving innovative solutions to complex challenges. I continuously explore emerging trends and like to share knowledge with peers. ",
      "linkedin":
          "https://www.linkedin.com/in/aditya-rekhe-94b27122a/?originalSubdomain=in",
      "github": "https://github.com/Geek-ASR",
      "cp_profile": "https://www.geeksforgeeks.org/user/adityare545t/",
      "Role": "Blockchain Technology",
      "Select": "Co-Lead"
    },
    {
      "Timestamp": "10/9/2024 15:57:25",
      "email": "dhirenjoshi2003@gmail.com",
      "Name": "Dhiren Joshi ",
      "Year": "TE",
      "Department": "Computer ",
      "Roll No.": "TCOD14",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1t7-8AsO9jZV7GRjQ0ci8_NhqNsS_FBvN",
      "formal_bio":
          "I am Dhiren Joshi, the Cloud Technology Co-Lead at Google Developer Group. With a strong passion for cloud computing, I'm dedicated to driving cloud adoption and contributing to the growth of our tech community.",
      "linkedin": "https://www.linkedin.com/in/dhiren-joshi-79500518a/",
      "github": "https://github.com/dhiren-joshi",
      "instagram":
          "https://www.instagram.com/dhiren__joshi?igsh=MW1ndWk1eHlhNDY4cA==",
      "Role": "Cloud Technology",
      "Select": "Co-Lead"
    },
    {
      "Timestamp": "10/9/2024 16:01:24",
      "email": "shaziakzameer@gmail.com",
      "Name": "Shazia Zameer Khateeb",
      "Year": "SE",
      "Department": "Computer Engineering",
      "Roll No.": "SCOC57",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=19SBcng76y_SHascSatMEe-jaDOLDQp7v",
      "formal_bio":
          "I’m Shazia Khateeb, and I have a strong interest in technology, particularly in understanding the mathematics behind it. I’m also focused on developing my soft skills and exploring areas like marketing. I enjoy discovering new and exciting fields, always striving to learn and grow in the process.",
      "linkedin":
          "https://www.linkedin.com/in/shazia-khateeb-54930b28b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
      "github": "https://github.com/ShaziaKhateeb",
      "Role": "Marketing"
    },
    {
      "Timestamp": "10/9/2024 16:37:15",
      "email": "adityapantula@gmail.com",
      "Name": "Aditya Pantula ",
      "Year": "TE",
      "Department": "CS",
      "Roll No.": 37,
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1jijr69w4_yJnANtX4a0wvWpUrqmKEDC3",
      "formal_bio":
          "I am Aditya Pantula, the Cloud Technology Lead of Google Developer Groups. I am AWS CLF C02 Certified. With a keen interest for solutions architecture, and robust proficiency in programming I am inclined to leverage my skills with the community to drive overall learning.",
      "linkedin": "https://www.linkedin.com/in/adityapantula",
      "github": "https://github.com/iamps0407",
      "instagram": "https://www.instagram.com/aditya.pantula",
      "cp_profile": "https://www.codechef.com/users/aditya_pantula",
      "Role": "Cloud Technology",
      "Select": "Lead"
    },
    {
      "Timestamp": "10/9/2024 18:45:57",
      "email": "atharvaparab9160@gmail.com",
      "Name": "Atharva Parab",
      "Year": "TE",
      "Department": "Computer Engineering ",
      "Roll No.": "TCOC 2",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1DbiHsym7IwIadpQVIddbILSs1OCVGT4a",
      "formal_bio":
          "I’m Atharva Parab, your GDG competitive programming Lead. Currently Knight on LeetCode and holding a 3-star rating on CodeChef. I have a deep passion for machine learning and data science, and I've been an NPTEL topper in multiple courses. My expertise spans across diverse domains, blending competitive coding with real-world machine learning applications.",
      "linkedin": "https://www.linkedin.com/in/atharva-parab/",
      "github": "https://github.com/atharvaparab9160",
      "instagram": "https://www.instagram.com/atharvaparab9160/",
      "cp_profile": "https://leetcode.com/u/atharvaparab9160/",
      "Role": "Competitive Programming",
      "Select": "Lead"
    },
    {
      "Timestamp": "10/10/2024 11:00:50",
      "email": "dhirenjoshi2003@gmail.com",
      "Name": "Dhiren Joshi ",
      "Year": "TE",
      "Department": "Computer ",
      "Roll No.": "TCOD14",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1xj4kvnMhGMgTaNQRaTyyYVbOCPJ0nmuU",
      "formal_bio":
          "I am Dhiren Joshi, the Cloud Technology Co-Lead at Google Developer Group. With a strong passion for cloud computing. I'm dedicated to driving cloud adoption and contributing to the growth of our tech community.",
      "linkedin": "https://www.linkedin.com/in/dhiren-joshi-79500518a/",
      "github": "https://github.com/dhiren-joshi",
      "instagram":
          "https://www.instagram.com/dhiren__joshi?igsh=MW1ndWk1eHlhNDY4cA==",
      "Role": "Cloud Technology",
      "Select": "Co-Lead"
    },
    {
      "Timestamp": "10/10/2024 11:40:19",
      "email": "abcdefghanushka8767@gmail.com",
      "Name": "Anushka Sao",
      "Year": "BE",
      "Department": "comp",
      "Roll No.": "BCOC17",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1-hm8y5qRlOjJJbtThctmHNv8T9eGb1hP",
      "formal_bio":
          "I am Anushka Sao, a Computer Engineering student skilled in Java, Spring Boot, and security. I have experience in data structures and databases, focusing on building secure, efficient, and scalable backend applications.",
      "linkedin": "https://www.linkedin.com/in/anushka-sao-811973229",
      "github": "https://github.com/AnushkaSao",
      "cp_profile": "https://leetcode.com/u/obsysi/",
      "Role": "Competitive Programming",
      "Select": "Member Lead"
    },
    {
      "Timestamp": "10/10/2024 14:32:37",
      "email": "harshilbohra88@gmail.com",
      "Name": "Harshil Bohra",
      "Year": "SE",
      "Department": "Information Technology",
      "Roll No.": "SIT10",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1KAgAMiu7mvoFvjBc04cA7gmzen5INnVX",
      "formal_bio":
          "A passionate Open Source Contributor and an avid Competitive Programmer, currently exploring AI and ML. With a strong foundation in problem-solving and a keen interest in innovative technologies.",
      "linkedin": "https://www.linkedin.com/in/harshilbohra/",
      "github": "https://github.com/prof7turtle",
      "cp_profile":
          "Codolio: https://codolio.com/profile/harshil7\nLeetcode: https://leetcode.com/u/prof7harshil/\nCodechef: https://www.codechef.com/users/harshil11",
      "Role": "Competitive Programming",
      "Select": "Member Lead"
    },
    {
      "Timestamp": "10/10/2024 18:46:45",
      "email": "pranavjadhav8289@gmail.com",
      "Name": "Pranav Jadhav",
      "Year": "SE",
      "Department": "Mechanical",
      "Roll No.": "SB55",
      "Upload_your_profile_pic":
          "https://drive.google.com/open?id=1z6-71dyNcVyK_-YLK0YAbs9I6jg0idjr",
      "formal_bio":
          "I'm Pranav Jadhav, currently studying Mechanical Engineering at DY Patil Pimpri. I finished my schooling at Kendriya Vidyalaya, Dehuroad. I'm passionate about entrepreneurship and aim to start my own business in the future.",
      "linkedin": "linkedin.com/in/pranav-jadhav-b190ab265",
      "github": "https://github.com/ipranav8289",
      "instagram": "https://www.instagram.com/ipranav_26/",
      "Role": "Marketing"
    }
  ];
}
