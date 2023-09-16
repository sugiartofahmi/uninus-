-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "fullname" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "refresh_token" TEXT,
    "role_id" INTEGER DEFAULT 1,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "avatar" TEXT,
    "isVerified" BOOLEAN DEFAULT false
);

-- CreateTable
CREATE TABLE "Students" (
    "id" TEXT NOT NULL,
    "nik" TEXT,
    "nisn" TEXT,
    "no_kk" TEXT,
    "gender_id" INTEGER,
    "religion_id" INTEGER,
    "birth_place" TEXT,
    "birth_date" TEXT,
    "phone_number" TEXT,
    "citizenship_id" INTEGER,
    "marital_status_id" INTEGER,
    "country_id" INTEGER,
    "address" TEXT,
    "subdistrict_id" INTEGER,
    "province_id" INTEGER,
    "city_id" INTEGER,
    "education_type_id" INTEGER,
    "education_major_id" INTEGER,
    "graduation_year" TEXT,
    "education_npsn" TEXT,
    "salary_id" INTEGER,
    "occupation_id" INTEGER,
    "occupation_position_id" INTEGER,
    "company_name" TEXT,
    "company_address" TEXT,
    "father_name" TEXT,
    "father_status_id" INTEGER,
    "father_education_id" INTEGER,
    "father_occupation_id" INTEGER,
    "father_position_id" INTEGER,
    "father_salary_id" INTEGER,
    "mother_name" TEXT,
    "mother_status_id" INTEGER,
    "mother_education_id" INTEGER,
    "mother_occupation_id" INTEGER,
    "mother_position_id" INTEGER,
    "mother_salary_id" INTEGER,
    "guardian_name" TEXT,
    "guardian_status_id" INTEGER,
    "guardian_education_id" INTEGER,
    "guardian_occupation_id" INTEGER,
    "guardian_position_id" INTEGER,
    "guardian_salary_id" INTEGER,
    "guardian_province_id" INTEGER,
    "guardian_subdistrict_id" INTEGER,
    "guardian_city_id" INTEGER,
    "guardian_address" TEXT,
    "parent_province_id" INTEGER,
    "parent_subdistrict_id" INTEGER,
    "parent_city_id" INTEGER,
    "parent_address" TEXT,
    "scholarship_id" INTEGER,
    "disabilities_id" INTEGER,
    "faculty_id" INTEGER,
    "department_id" INTEGER,
    "academic_year" TEXT,
    "user_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "StudentGrade" (
    "id" TEXT NOT NULL,
    "subject" TEXT,
    "semester" TEXT,
    "grade" DOUBLE PRECISION DEFAULT 0,
    "pmb_id" TEXT
);

-- CreateTable
CREATE TABLE "PMB" (
    "id" TEXT NOT NULL,
    "degree_program_id" INTEGER,
    "first_deparment_id" INTEGER,
    "second_deparment_id" INTEGER,
    "registration_status_id" INTEGER,
    "registration_number" TEXT,
    "selection_path_id" INTEGER,
    "student_id" TEXT,
    "utbk_pu" DOUBLE PRECISION DEFAULT 0,
    "utbk_kk" DOUBLE PRECISION DEFAULT 0,
    "utbk_ppu" DOUBLE PRECISION DEFAULT 0,
    "utbk_kmbm" DOUBLE PRECISION DEFAULT 0,
    "average_utbk" DOUBLE PRECISION DEFAULT 0,
    "utbk" DOUBLE PRECISION DEFAULT 0,
    "average_grade" DOUBLE PRECISION DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "RegistrationStatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT,

    CONSTRAINT "RegistrationStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Documents" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "path" TEXT NOT NULL,
    "pmb_id" TEXT
);

-- CreateTable
CREATE TABLE "EducationTypes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "degree_program_id" INTEGER,

    CONSTRAINT "EducationTypes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EducationMajor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "education_type_id" INTEGER NOT NULL,

    CONSTRAINT "EducationMajor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ParentEducation" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ParentEducation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ParentStatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ParentStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Province" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Province_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "City" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "province_id" INTEGER NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubDistrict" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "city_id" INTEGER NOT NULL,

    CONSTRAINT "SubDistrict_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Roles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permissions" (
    "id" INTEGER NOT NULL DEFAULT 1,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RolesPermissions" (
    "id" SERIAL NOT NULL,
    "role_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RolesPermissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OTP" (
    "id" SERIAL NOT NULL,
    "token" TEXT NOT NULL,
    "expiredAt" BIGINT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "OTP_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DegreeProgram" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DegreeProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SelectionPath" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "degree_program_id" INTEGER,

    CONSTRAINT "SelectionPath_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Faculty" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "degree_program_id" INTEGER,

    CONSTRAINT "Faculty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "faculty_id" INTEGER,
    "degree_program_id" INTEGER,

    CONSTRAINT "Department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaritalStatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "MaritalStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Religion" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Religion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gender" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Gender_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Citizenship" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Citizenship_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Salary" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Salary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Education" (
    "id" SERIAL NOT NULL,
    "npsn" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "province" TEXT NOT NULL,
    "district_city" TEXT NOT NULL,
    "sub_district" TEXT NOT NULL,
    "street_address" TEXT NOT NULL,
    "education_type_id" INTEGER NOT NULL,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "citizenship_id" INTEGER,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Occupation" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Occupation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OccupationPosition" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "occupation_id" INTEGER,

    CONSTRAINT "OccupationPosition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Disabilities" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Disabilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Scholarship" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Scholarship_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Questions" (
    "id" SERIAL NOT NULL,
    "question" TEXT NOT NULL,
    "correct_answer" TEXT NOT NULL,
    "incorrect_answers" TEXT[],

    CONSTRAINT "Questions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employees" (
    "id" SERIAL NOT NULL,
    "nip" TEXT,
    "nidn" TEXT,
    "birth_date" TEXT,
    "user_id" TEXT NOT NULL,
    "employee_status_id" INTEGER,
    "addition_task" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "EmployeeHasEducation" (
    "id" SERIAL NOT NULL,
    "education_id" INTEGER NOT NULL,
    "employee_id" INTEGER NOT NULL,

    CONSTRAINT "EmployeeHasEducation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmployeeHasCategory" (
    "id" SERIAL NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "employee_category_id" INTEGER NOT NULL,

    CONSTRAINT "EmployeeHasCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmployeeHasWorkUnit" (
    "id" SERIAL NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "work_unit_id" INTEGER NOT NULL,

    CONSTRAINT "EmployeeHasWorkUnit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Lecturers" (
    "id" TEXT NOT NULL,
    "lecturer_certification" BOOLEAN,
    "lecturer_position_id" INTEGER,
    "faculty_id" INTEGER,
    "department_id" INTEGER,
    "user_id" TEXT NOT NULL,
    "employee_id" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "AcademicStaff" (
    "id" TEXT NOT NULL,
    "employee_id" INTEGER,
    "academic_position_id" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "CertificationProfession" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "path" TEXT NOT NULL,
    "employee_id" INTEGER NOT NULL,

    CONSTRAINT "CertificationProfession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmployeeStatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "WorkUnitCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "WorkUnit" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "work_unit_category_id" INTEGER
);

-- CreateTable
CREATE TABLE "LecturerPosition" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "civil_service_level_id" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "AcademicPosition" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "civil_service_level_id" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "CivilServiceLevel" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "EmployeeCategories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "AppointmentDecree" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "employee_id" INTEGER NOT NULL,

    CONSTRAINT "AppointmentDecree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PermissionsToRoles" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_id_key" ON "Users"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Students_id_key" ON "Students"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Students_phone_number_key" ON "Students"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "Students_user_id_key" ON "Students"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentGrade_id_key" ON "StudentGrade"("id");

-- CreateIndex
CREATE UNIQUE INDEX "PMB_id_key" ON "PMB"("id");

-- CreateIndex
CREATE UNIQUE INDEX "PMB_student_id_key" ON "PMB"("student_id");

-- CreateIndex
CREATE UNIQUE INDEX "Documents_id_key" ON "Documents"("id");

-- CreateIndex
CREATE UNIQUE INDEX "OTP_user_id_key" ON "OTP"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Education_npsn_key" ON "Education"("npsn");

-- CreateIndex
CREATE UNIQUE INDEX "Employees_id_key" ON "Employees"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Employees_user_id_key" ON "Employees"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Lecturers_id_key" ON "Lecturers"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Lecturers_user_id_key" ON "Lecturers"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Lecturers_employee_id_key" ON "Lecturers"("employee_id");

-- CreateIndex
CREATE UNIQUE INDEX "AcademicStaff_id_key" ON "AcademicStaff"("id");

-- CreateIndex
CREATE UNIQUE INDEX "AcademicStaff_employee_id_key" ON "AcademicStaff"("employee_id");

-- CreateIndex
CREATE UNIQUE INDEX "EmployeeStatus_id_key" ON "EmployeeStatus"("id");

-- CreateIndex
CREATE UNIQUE INDEX "WorkUnitCategory_id_key" ON "WorkUnitCategory"("id");

-- CreateIndex
CREATE UNIQUE INDEX "WorkUnit_id_key" ON "WorkUnit"("id");

-- CreateIndex
CREATE UNIQUE INDEX "LecturerPosition_id_key" ON "LecturerPosition"("id");

-- CreateIndex
CREATE UNIQUE INDEX "AcademicPosition_id_key" ON "AcademicPosition"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CivilServiceLevel_id_key" ON "CivilServiceLevel"("id");

-- CreateIndex
CREATE UNIQUE INDEX "EmployeeCategories_id_key" ON "EmployeeCategories"("id");

-- CreateIndex
CREATE UNIQUE INDEX "_PermissionsToRoles_AB_unique" ON "_PermissionsToRoles"("A", "B");

-- CreateIndex
CREATE INDEX "_PermissionsToRoles_B_index" ON "_PermissionsToRoles"("B");

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "Roles"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "Gender"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_religion_id_fkey" FOREIGN KEY ("religion_id") REFERENCES "Religion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_citizenship_id_fkey" FOREIGN KEY ("citizenship_id") REFERENCES "Citizenship"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_marital_status_id_fkey" FOREIGN KEY ("marital_status_id") REFERENCES "MaritalStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "Country"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_subdistrict_id_fkey" FOREIGN KEY ("subdistrict_id") REFERENCES "SubDistrict"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "Province"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_education_type_id_fkey" FOREIGN KEY ("education_type_id") REFERENCES "EducationTypes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_education_major_id_fkey" FOREIGN KEY ("education_major_id") REFERENCES "EducationMajor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_education_npsn_fkey" FOREIGN KEY ("education_npsn") REFERENCES "Education"("npsn") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_salary_id_fkey" FOREIGN KEY ("salary_id") REFERENCES "Salary"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_occupation_id_fkey" FOREIGN KEY ("occupation_id") REFERENCES "Occupation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_occupation_position_id_fkey" FOREIGN KEY ("occupation_position_id") REFERENCES "OccupationPosition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_father_status_id_fkey" FOREIGN KEY ("father_status_id") REFERENCES "ParentStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_father_education_id_fkey" FOREIGN KEY ("father_education_id") REFERENCES "ParentEducation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_father_occupation_id_fkey" FOREIGN KEY ("father_occupation_id") REFERENCES "Occupation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_father_position_id_fkey" FOREIGN KEY ("father_position_id") REFERENCES "OccupationPosition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_father_salary_id_fkey" FOREIGN KEY ("father_salary_id") REFERENCES "Salary"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_mother_status_id_fkey" FOREIGN KEY ("mother_status_id") REFERENCES "ParentStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_mother_education_id_fkey" FOREIGN KEY ("mother_education_id") REFERENCES "ParentEducation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_mother_occupation_id_fkey" FOREIGN KEY ("mother_occupation_id") REFERENCES "Occupation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_mother_position_id_fkey" FOREIGN KEY ("mother_position_id") REFERENCES "OccupationPosition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_mother_salary_id_fkey" FOREIGN KEY ("mother_salary_id") REFERENCES "Salary"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_status_id_fkey" FOREIGN KEY ("guardian_status_id") REFERENCES "ParentStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_education_id_fkey" FOREIGN KEY ("guardian_education_id") REFERENCES "ParentEducation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_occupation_id_fkey" FOREIGN KEY ("guardian_occupation_id") REFERENCES "Occupation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_position_id_fkey" FOREIGN KEY ("guardian_position_id") REFERENCES "OccupationPosition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_salary_id_fkey" FOREIGN KEY ("guardian_salary_id") REFERENCES "Salary"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_province_id_fkey" FOREIGN KEY ("guardian_province_id") REFERENCES "Province"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_subdistrict_id_fkey" FOREIGN KEY ("guardian_subdistrict_id") REFERENCES "SubDistrict"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_guardian_city_id_fkey" FOREIGN KEY ("guardian_city_id") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_parent_province_id_fkey" FOREIGN KEY ("parent_province_id") REFERENCES "Province"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_parent_subdistrict_id_fkey" FOREIGN KEY ("parent_subdistrict_id") REFERENCES "SubDistrict"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_parent_city_id_fkey" FOREIGN KEY ("parent_city_id") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_scholarship_id_fkey" FOREIGN KEY ("scholarship_id") REFERENCES "Scholarship"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_disabilities_id_fkey" FOREIGN KEY ("disabilities_id") REFERENCES "Disabilities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_faculty_id_fkey" FOREIGN KEY ("faculty_id") REFERENCES "Faculty"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Students" ADD CONSTRAINT "Students_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentGrade" ADD CONSTRAINT "StudentGrade_pmb_id_fkey" FOREIGN KEY ("pmb_id") REFERENCES "PMB"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PMB" ADD CONSTRAINT "PMB_degree_program_id_fkey" FOREIGN KEY ("degree_program_id") REFERENCES "DegreeProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PMB" ADD CONSTRAINT "PMB_first_deparment_id_fkey" FOREIGN KEY ("first_deparment_id") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PMB" ADD CONSTRAINT "PMB_second_deparment_id_fkey" FOREIGN KEY ("second_deparment_id") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PMB" ADD CONSTRAINT "PMB_registration_status_id_fkey" FOREIGN KEY ("registration_status_id") REFERENCES "RegistrationStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PMB" ADD CONSTRAINT "PMB_selection_path_id_fkey" FOREIGN KEY ("selection_path_id") REFERENCES "SelectionPath"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PMB" ADD CONSTRAINT "PMB_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documents" ADD CONSTRAINT "Documents_pmb_id_fkey" FOREIGN KEY ("pmb_id") REFERENCES "PMB"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EducationTypes" ADD CONSTRAINT "EducationTypes_degree_program_id_fkey" FOREIGN KEY ("degree_program_id") REFERENCES "DegreeProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EducationMajor" ADD CONSTRAINT "EducationMajor_education_type_id_fkey" FOREIGN KEY ("education_type_id") REFERENCES "EducationTypes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "Province"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubDistrict" ADD CONSTRAINT "SubDistrict_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "City"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolesPermissions" ADD CONSTRAINT "RolesPermissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "Permissions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolesPermissions" ADD CONSTRAINT "RolesPermissions_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "Roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OTP" ADD CONSTRAINT "OTP_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SelectionPath" ADD CONSTRAINT "SelectionPath_degree_program_id_fkey" FOREIGN KEY ("degree_program_id") REFERENCES "DegreeProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Faculty" ADD CONSTRAINT "Faculty_degree_program_id_fkey" FOREIGN KEY ("degree_program_id") REFERENCES "DegreeProgram"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_faculty_id_fkey" FOREIGN KEY ("faculty_id") REFERENCES "Faculty"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_degree_program_id_fkey" FOREIGN KEY ("degree_program_id") REFERENCES "DegreeProgram"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_education_type_id_fkey" FOREIGN KEY ("education_type_id") REFERENCES "EducationTypes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Country" ADD CONSTRAINT "Country_citizenship_id_fkey" FOREIGN KEY ("citizenship_id") REFERENCES "Citizenship"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OccupationPosition" ADD CONSTRAINT "OccupationPosition_occupation_id_fkey" FOREIGN KEY ("occupation_id") REFERENCES "Occupation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employees" ADD CONSTRAINT "Employees_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employees" ADD CONSTRAINT "Employees_employee_status_id_fkey" FOREIGN KEY ("employee_status_id") REFERENCES "EmployeeStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeHasEducation" ADD CONSTRAINT "EmployeeHasEducation_education_id_fkey" FOREIGN KEY ("education_id") REFERENCES "Education"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeHasEducation" ADD CONSTRAINT "EmployeeHasEducation_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeHasCategory" ADD CONSTRAINT "EmployeeHasCategory_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeHasCategory" ADD CONSTRAINT "EmployeeHasCategory_employee_category_id_fkey" FOREIGN KEY ("employee_category_id") REFERENCES "EmployeeCategories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeHasWorkUnit" ADD CONSTRAINT "EmployeeHasWorkUnit_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeHasWorkUnit" ADD CONSTRAINT "EmployeeHasWorkUnit_work_unit_id_fkey" FOREIGN KEY ("work_unit_id") REFERENCES "WorkUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lecturers" ADD CONSTRAINT "Lecturers_lecturer_position_id_fkey" FOREIGN KEY ("lecturer_position_id") REFERENCES "LecturerPosition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lecturers" ADD CONSTRAINT "Lecturers_faculty_id_fkey" FOREIGN KEY ("faculty_id") REFERENCES "Faculty"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lecturers" ADD CONSTRAINT "Lecturers_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lecturers" ADD CONSTRAINT "Lecturers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lecturers" ADD CONSTRAINT "Lecturers_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AcademicStaff" ADD CONSTRAINT "AcademicStaff_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AcademicStaff" ADD CONSTRAINT "AcademicStaff_academic_position_id_fkey" FOREIGN KEY ("academic_position_id") REFERENCES "AcademicPosition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CertificationProfession" ADD CONSTRAINT "CertificationProfession_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkUnit" ADD CONSTRAINT "WorkUnit_work_unit_category_id_fkey" FOREIGN KEY ("work_unit_category_id") REFERENCES "WorkUnitCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LecturerPosition" ADD CONSTRAINT "LecturerPosition_civil_service_level_id_fkey" FOREIGN KEY ("civil_service_level_id") REFERENCES "CivilServiceLevel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AcademicPosition" ADD CONSTRAINT "AcademicPosition_civil_service_level_id_fkey" FOREIGN KEY ("civil_service_level_id") REFERENCES "CivilServiceLevel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDecree" ADD CONSTRAINT "AppointmentDecree_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PermissionsToRoles" ADD CONSTRAINT "_PermissionsToRoles_A_fkey" FOREIGN KEY ("A") REFERENCES "Permissions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PermissionsToRoles" ADD CONSTRAINT "_PermissionsToRoles_B_fkey" FOREIGN KEY ("B") REFERENCES "Roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;
