package com.library.controller.borrow;

import com.library.domain.Borrow;
import com.library.forms.BorrowForm;
import com.library.mappers.BorrowFormToBorrowMapper;
import com.library.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.time.LocalDate;

import static com.library.utils.GlobalAttributes.ALERT_MESSAGE;
import static com.library.utils.GlobalAttributes.ALERT_TYPE;
import static javax.servlet.RequestDispatcher.ERROR_MESSAGE;

@Controller
public class BorrowCreateController {
    private static final String BORROWS_FORM = "borrowForm";
    private static final String BORROW_CREATE_ERROR = "borrowCreateError";

    @Autowired
    private BorrowService borrowService;

    @Autowired
    private BorrowFormToBorrowMapper mapper;

    @GetMapping(value = "/admin/borrows/create")
    public String createBorrows(Model model) {

        model.addAttribute(BORROWS_FORM, new BorrowForm());
        return "pages/borrows_create";
    }

    @PostMapping(value = "/admin/borrows/create")
    public String createBorrows(Model model,
                                @Valid @ModelAttribute(BORROWS_FORM)
                                        BorrowForm borrowForm,
                                BindingResult bindingResult, RedirectAttributes redirectAttrs) {

        if (bindingResult.hasErrors()) {
            //have some error handling here, perhaps add extra error messages to the model
            model.addAttribute(ERROR_MESSAGE, "an error occurred");
            return "pages/borrows_create";
        }
        Borrow borrow = mapper.mapToBorrowModel(borrowForm);
        if (isValidBorrowEmptyFields(borrow)){
            borrowService.createBorrow(borrow);
            redirectAttrs.addFlashAttribute(ALERT_TYPE, "success");
            redirectAttrs.addFlashAttribute(ALERT_MESSAGE, "Borrow Created Successfully!");
            return "redirect:/admin/borrows";
        }
        else {
            model.addAttribute(BORROWS_FORM, borrowForm);
            model.addAttribute(BORROW_CREATE_ERROR, "Please fill all fields!");
            return "pages/borrows_create";
        }
    }

    private boolean isValidBorrowEmptyFields(Borrow borrow){
        boolean isValid   = true;
        LocalDate date = borrow.getDate();
        LocalDate returnDate = borrow.getReturnDate();
        String status = borrow.getStatus();
        String membNumber = borrow.getMembNumber();
        String bookPin = borrow.getBookPin();
        if (date == null || status.isEmpty() || membNumber.isEmpty() || returnDate == null || bookPin.isEmpty() ){
            isValid = false;
        }

        return isValid;
    }

}
