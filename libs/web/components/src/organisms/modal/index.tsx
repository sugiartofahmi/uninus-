import { Button } from "../../atoms";
import { ModalProps } from "./interface";
import { IoCloseSharp } from "react-icons/io5";
import { createPortal } from "react-dom";
import { FC, ReactElement } from "react";
import clsx from "clsx";
export const Modal: FC<ModalProps> = ({
  showModal,
  onClose,
  iconClose = true,
  modalTitle,
  position = "center",
  children,
  size = "full",
  className = "max-w-2xl max-h-full rounded-lg bg-primary-white",
  closeClassName = "text-primary-black",
  headerColor = "white",
  footerColor = "white",
  bodyClassName = "p-6 space-y-8",
}): ReactElement | null => {
  if (!showModal) {
    return null;
  }

  const modalWidth = clsx(`relative ${className}`, {
    "w-full": size === "full",
    "lg:w-30% w-full md:w-[60%]": size === "modal-question",
  });
  const modalPositions = clsx(
    `fixed w-full top-0 left-0 right-0 bottom-0 h-screen flex  bg-primary-black bg-opacity-50 z-50 p-4 overflow-x-hidden overflow-y-auto md:inset-0 backdrop-blur-sm `,
    {
      " justify-center items-center": position === "center",
      "justify-end items-start": position === "right-start",
    },
  );
  const modalHeaderColors = clsx(`flex items-center justify-between py-4 px-4 rounded-t `, {
    "bg-secondary-green-1": headerColor === "secondary-green",
    "bg-primary-white drop-shadow-md": headerColor === "white-shadow",
    "bg-primary-white": headerColor === "white",
    "bg-red-7": headerColor === "red",
    "bg-primary-orange": headerColor === "orange",
    "bg-primary-green": headerColor === "green",
  });
  const modalFooterColors = clsx(`w-full h-[30px] rounded-b `, {
    "bg-primary-green": footerColor === "green",
    "bg-primary-white": footerColor === "white",
  });
  return (
    showModal &&
    createPortal(
      <div className={modalPositions}>
        <div data-testid="modal-landing" className={modalWidth}>
          <div className="relative bg-white rounded-lg shadow">
            <div className={modalHeaderColors}>
              <div className="text-xl font-semibold text-gray-900 w-full md:px-10 lg:px-4 ">
                {modalTitle}
              </div>
              {iconClose ? (
                <Button onClick={onClose} variant="text-icon" size="sm">
                  <IoCloseSharp size={25} className={closeClassName} />
                </Button>
              ) : (
                ""
              )}
            </div>
            <div className={bodyClassName}>{children}</div>
            <div className={modalFooterColors}></div>
          </div>
        </div>
      </div>,
      document.getElementById("modal-landing") as HTMLElement,
    )
  );
};
