"use client";
import { ReactElement, FC, useMemo, useState, useEffect } from "react";
import { DataDiriSection } from "./section/data-diri";
import { CaretRightOutlined } from "@ant-design/icons";
import { DataPendidikanSection } from "./section/data-pendidikan";
import { DataOrtuSection } from "./section/data-ortu";
import { DataNilaiSection } from "./section/data-nilai";
import { Button } from "@uninus/web/components";
import Link from "next/link";
import { useStudentData } from "@uninus/web/services";

export const ModuleBiodata: FC = (): ReactElement => {
  const [degreeProgram, setDegreeProgram] = useState<number | null | undefined>(null);

  const { getStudent } = useStudentData();
  const student = useMemo(() => {
    return getStudent;
  }, [getStudent]);
  const routeCondition =
    student?.disabilities_id !== null ||
    Number(student?.average_grade) >= 80 ||
    Number(student?.utbk) >= 500;
  useEffect(() => {
    setDegreeProgram(student?.degree_program_id);
  }, [student]);

  return (
    <section
      key="dashboard-biodata"
      className="flex flex-col text-center px-4 gap-y-6  lg:text-start"
    >
      <div className="2xl:text-2xl">
        <h1 className="text-slate-5">
          PMB <span className="text-secondary-green-4"> / Registrasi</span>
        </h1>
        <p className=" text-lg 2xl:text-2xl font-extrabold pt-2 text-secondary-green-4">
          Pengisian Data Registrasi
        </p>
      </div>

      <section className="flex flex-col gap-4 w-full bg-primary-white p-4 rounded-lg shadow-lg">
        <section className="flex flex-col gap-8 w-full justify-center items-center py-2 rounded-lg bg-primary-white overflow-x-hidden">
          {degreeProgram === 1 ? (
            <section key="s1" className="w-full flex flex-col gap-y-2">
              <DataDiriSection />
              <DataPendidikanSection />
              <DataNilaiSection />
              <DataOrtuSection />
            </section>
          ) : (
            <section key="s2" className="w-full flex flex-col gap-y-2">
              <DataDiriSection />
              <DataPendidikanSection />
              <DataOrtuSection />
            </section>
          )}
        </section>

        <div className="flex gap-6 justify-end px-8 py-4">
          <Link
            href={
              routeCondition
                ? "/dashboard/registrasi/beasiswa"
                : "/dashboard/registrasi/pembayaran/detail"
            }
          >
            <Button
              variant="filled"
              size="md"
              width="w-auto"
              styling="text-xs md:text-sm lg:text-base"
            >
              <p className="px-2 flex">
                {routeCondition ? "Pilih Beasiswa" : "Lakukan Pembayaran"}
              </p>
              <CaretRightOutlined />
            </Button>
          </Link>
        </div>
      </section>
    </section>
  );
};
